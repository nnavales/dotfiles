[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source ~/.config/colors/current/fzf.sh

# Load all fzf functions/keybindings.
for f in ~/.config/fzf/functions/*.zsh(N); do
  source "$f"
done
unset f
