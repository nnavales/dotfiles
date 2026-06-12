fzf-history() {
  local selected query
  query="$BUFFER"

  selected=$(
    fc -l 1 |
    sed 's/^ *[0-9]\+\*\? *//' |
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
