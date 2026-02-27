[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_OPTS=" \
  --tmux=82% \
  --ansi \
  --cycle \
  --no-mouse \
  --info=inline-right \
  --layout=reverse \
  --border=rounded \
  --prompt='› ' \
  --pointer='>' \
  --marker='*' \
  --color=bg:#1F2225 \
  --color=fg:#E9F2F2 \
  --color=hl:#D9CC58 \
  --color=fg+:#E9F2F2 \
  --color=bg+:#33383C \
  --color=hl+:#D9CC58 \
  --color=info:#879297 \
  --color=prompt:#A5E9F5 \
  --color=pointer:#D9CC58 \
  --color=marker:#D78CF0 \
  --color=spinner:#A5E9F5 \
  --color=header:#A5E9F5 \
  --color=border:#272C2F \
  --color=gutter:#1F2225 \
  --color=query:#E9F2F2:regular \
  --color=scrollbar:#272C2F \
  --color=separator:#879297 \
  --highlight-line \
"

fzf-history() {
  local selected query
  query="$BUFFER"   

  selected=$(
    fc -l 1 |
    sed 's/^ *[0-9]\+ *//' |
    fzf --tac +s \
        --prompt="history > " \
        --query="$query"
  )

  if [[ -n $selected ]]; then
    BUFFER="$selected"
    CURSOR=${#BUFFER}
  fi
}

zle -N fzf-history
bindkey '^R' fzf-history

cpf() {
  local files
  files=$(fd . --type f --hidden ~ | fzf --multi --prompt="files to copy (tab to select) > ")

  if [[ -n "$files" ]]; then
    echo "$files" | while IFS= read -r file; do
      cp -v "$file" "./$(basename "$file")"
    done
  else
    echo "select a file next time xD."
  fi
}

cpd() {
  local dirs
  dirs=$(fd . --type d --hidden ~ | fzf --multi --prompt="folders to copy (tab to select) > ")

  if [[ -n "$dirs" ]]; then
    echo "$dirs" | while IFS= read -r dir; do
      cp -vr "$dir" "./$(basename "$dir")"
    done
  else
    echo "select a dir next time xD."
  fi
}


fkill() {
  local pid

  if [[ $EUID -ne 0 ]]; then
    pid=$(
      ps -u "$UID" -o pid,ppid,comm,%cpu,%mem --sort=-%mem \
        | fzf --multi \
        | awk '{print $1}'
    )
  else
    pid=$(
      ps -eo pid,ppid,comm,%cpu,%mem --sort=-%mem \
        | fzf \
        | awk '{print $1}'
    )
  fi

  [[ -n "$pid" ]] && echo "$pid" | xargs kill -"${1:-9}"
}

zle -N fkill
bindkey '^K' fkill


fpath_any() {
  local last_arg=${LBUFFER##* }
  local dir="${last_arg/#\~/$HOME}" 
  [[ ! -d "$dir" ]] && dir="$PWD"

  local file
  file=$(fd -HI --absolute-path . "$dir" --type f \
    | fzf --prompt="file > " \
          --preview '[[ $(file --mime-type -b {}) == text/* ]] && bat --color=always {} || ([[ $(file --mime-type -b {}) =~ ^image/ ]] && chafa {} || file --brief {})' \
          --preview-window=right:50%)

  if [[ -n "$file" ]]; then
    LBUFFER="${LBUFFER%$last_arg*}$file "
  fi

  zle reset-prompt
}

zle -N fpath_any
bindkey '^P' fpath_any



bookie() {
    local file
    file=$(
        fd . /home/nahuel/personal/hub/bookies -t f -e pdf -e epub --hidden \
        | awk '{bn=$0; sub(".*/","",bn); printf "%s\t%s\n", bn, $0}' \
        | fzf --multi --prompt="Select book > " --with-nth=1 --delimiter="\t" \
        | cut -f2
    )

    if [[ -n "$file" ]]; then
        echo "$file" | while IFS= read -r f; do
            ebook-viewer "$f" &
        done
    else
        echo "no book selected."
    fi
}
