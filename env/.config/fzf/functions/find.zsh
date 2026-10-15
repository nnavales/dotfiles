
fpath_any() {
  local last_arg=${LBUFFER##* }
  local dir="${last_arg/#\~/$HOME}"
  [[ ! -d "$dir" ]] && dir="$PWD"

  local file
  file=$(fd -HI --absolute-path . "$dir" --type f |
    fzf --prompt="file > " \
      --preview '
        mime=$(file --mime-type -b -- {})
        case "$mime" in
          text/*)
            bat --color=always --style=numbers -- {}
            ;;
          image/*)
            dim="${FZF_PREVIEW_COLUMNS}x${FZF_PREVIEW_LINES}"
            kitten icat \
              --clear \
              --transfer-mode=memory \
              --unicode-placeholder \
              --stdin=no \
              --place="$dim@0x0" \
              -- {} |
              sed '\''$d'\'' |
              sed $'\''$s/$/\e[m/'\''
            ;;
          *)
            file --brief -- {}
            ;;
        esac
      ' \
      --preview-window=right:50%)

  if [[ -n "$file" ]]; then
    LBUFFER="${LBUFFER%$last_arg*}$file "
  fi

  zle reset-prompt
}
zle -N fpath_any
bindkey '^P' fpath_any
