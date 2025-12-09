# source
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh
source ~/.zsh_profile

# setup tools
[ -f ~/.config/fzf/config.zsh ] && source ~/.config/fzf/config.zsh
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval "$(uv generate-shell-completion zsh)" 
export LS_COLORS="..."
export EZA_COLORS="..."


export MANWIDTH=$(tput cols)
export MANPAGER="less -S -j.5 -FX"
export LESS=-R

export BAT_STYLE="plain"
export BAT_THEME="rose-pine-moon"
export BAT_PAGER="less -FR"

HISTSIZE=5000
SAVEHIST=10000
HIST_IGNORE_DUPS=1
HIST_IGNORE_ALL_DUPS=1
HIST_FIND_NO_DUPS=1

# alias
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
bindkey -s ^f "tmux-sessionizer\n"
unalias ls 2>/dev/null
alias vim=nvim
alias ls='eza'
alias l='eza -l'
alias la='eza -la'
alias lt='eza --tree'
alias cat="bat"
alias rg='rg --no-ignore'
alias cd="z"
setopt IGNORE_EOF
bindkey '^[w' forward-word     


