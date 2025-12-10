[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_OPTS=" \
  --tmux=82% \
  --ansi \
  --cycle \
  --no-mouse \
  --layout=reverse \
  --border=rounded \
  --info=inline \
  --prompt='▶ ' \
  --pointer='◆' \
  --marker='*' \
  --separator='━' \
  --color=bg:#1a1d23,hl:#ea9a97 \
  --color=fg+:#e0def4,bg+:#33364a,hl+:#ea9a97 \
  --color=info:#f6c177,prompt:#9ccfd8,pointer:#f6c177 \
  --color=marker:#f6c177,spinner:#9ccfd8,header:#9ccfd8,border:#1a1d23 \
"

fzf-history() {
  local selected
  selected=$(fc -l 1 | sed 's/^ *[0-9]\+ *//' | fzf --tac +s --prompt="history > ")
  
  if [[ -n $selected ]]; then
    BUFFER="$selected"
    CURSOR=$#BUFFER
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
  local dir
  dir=$(eval echo "$last_arg")
  [[ ! -d "$dir" ]] && dir="$PWD"

  local file
  file=$(fd --absolute-path . "$dir" --type f \
    | fzf --prompt="file > " \
        --preview '([[ $(file --mime-type -b {}) == text/* ]] \
          && bat --color=always {} \
          || ([[ $(file --mime-type -b {}) =~ ^image/ ]] \
          && chafa {} \
                || file --brief {}))' \
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
