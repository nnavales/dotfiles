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
