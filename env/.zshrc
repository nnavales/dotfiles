source "$HOME/.zsh_profile"

fpath=("$HOME/.zsh/completions" $fpath)

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

autoload -Uz compinit
if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi

[[ -f "$XDG_CONFIG_HOME/fzf/config.zsh" ]] && source "$XDG_CONFIG_HOME/fzf/config.zsh"
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

export MANWIDTH=$(tput cols)
export MANPAGER="less -S -j.5 -FX"
export LESS='-R'

export BAT_STYLE="plain"
export BAT_THEME="paragon"
export BAT_PAGER="less -FR"

HISTFILE="$HOME/.zsh_history"
HISTSIZE=5000
SAVEHIST=10000

setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY

bindkey -s ^f "tmux-sessionizer\n"
bindkey '^[w' forward-word
setopt IGNORE_EOF

alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias vim="nvim"
alias ls='eza'
alias l='eza -l'
alias la='eza -la'
alias lt='eza --tree'
alias cat="bat"
alias rg='rg --no-ignore'
alias cd="z"
