# Enable colors and change prompt:

# Load aliases if existent.
[ -f "$HOME/.config/zsh/alias.zsh" ] && source "$HOME/.config/zsh/alias.zsh"
[ -f "$HOME/.config/zsh/completion.zsh" ] && source "$HOME/.config/zsh/completion.zsh"
[ -f "$HOME/.config/zsh/key-bindings.zsh" ] && source "$HOME/.config/zsh/key-bindings.zsh"
# Load exports if existent.
[ -f "$HOME/.config/zsh/exports.zsh" ] && source "$HOME/.config/zsh/exports.zsh"
# Load enviorment variables.
[ -f "$HOME/.zshenv" ] && source "$HOME/.zshenv"

# Fzf widgets for zsh
source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh
fpath=(/usr/share/zsh/site-functions/ $fpath)
# Load zsh-syntax-highlighting and zsh-autosuggestions; should be last.
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

eval "$(starship init zsh)"
