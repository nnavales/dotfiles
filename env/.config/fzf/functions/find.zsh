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
