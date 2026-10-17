# ~/.bashrc — Termux (clean/green)
#
# Avoid double-loading (SSH login may source bashrc twice)
[ -n "$TERMUX_BASHRC_LOADED" ] && return
TERMUX_BASHRC_LOADED=1

# --- PATH: add ~/bin ---
case ":$PATH:" in
*":$HOME/bin:"*) ;;
*) export PATH="$HOME/bin:$PATH" ;;
esac

# --- History ---
export HISTSIZE=10000
export HISTFILESIZE=20000
export HISTCONTROL=ignoreboth:erasedups
shopt -s histappend checkwinsize

# --- Colors for ls / grep ---
alias ls='ls --color=auto'
alias ll='ls -lah --color=auto'
alias la='ls -A --color=auto'
alias grep='grep --color=auto'

# --- Shortcuts ---
alias ..='cd ..'
alias ...='cd ../..'
alias c='clear'

# --- Clean green prompt ---
PS1='\[\e[1;32m\]\w\[\e[0m\] \[\e[32m\]\$\[\e[0m\] '
