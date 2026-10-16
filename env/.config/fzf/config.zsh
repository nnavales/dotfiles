[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source ~/.config/colors/current/fzf.sh
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --height=100% --margin=20%,10%"

# Load all fzf functions/keybindings.
for f in ~/.config/fzf/functions/*.zsh(N); do
  source "$f"
done
unset f
