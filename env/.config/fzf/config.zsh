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
  --color=bg:#1E2124 \
  --color=fg:#DCE5E5 \
  --color=hl:#E4C56B \
  --color=fg+:#DCE5E5 \
  --color=bg+:#33383D \
  --color=hl+:#E4C56B \
  --color=info:#789AA1 \
  --color=prompt:#A1DEEA \
  --color=pointer:#E4C56B \
  --color=marker:#B895DE \
  --color=spinner:#A1DEEA \
  --color=header:#A1DEEA \
  --color=border:#282B2F \
  --color=gutter:#1E2124 \
  --color=query:#DCE5E5:regular \
  --color=scrollbar:#282B2F \
  --color=separator:#789AA1 \
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
          --preview 'zsh -c "
            mime=\$(file --mime-type -b {})
            case \$mime in
              text/*) bat --color=always {} ;;
              image/*) chafa --format symbols --size=\${FZF_PREVIEW_COLUMNS}x\${FZF_PREVIEW_LINES} {} ;;
              *) file --brief {} ;;
            esac
          "' \
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
