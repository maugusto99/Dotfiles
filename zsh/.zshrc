# Enable colors and change prompt:
autoload -U colors && colors
# options 
setopt autocd menu_complete
PROMPT="%B%F{red}[%f%b%B%F{white}%n%f%b%B%F{magenta}@%f%b%B%F{cyan}%2~%f%b%B%F{red}]%f%b "


# History in cache directory:
export HISTORY_IGNORE="(ls|cd|pwd|exit|reboot|history|cd -|cd ..)"
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.config/zsh/.zsh_history

# Load shortcuts if existent.
[ -f "$HOME/.config/zsh/keybindings.emacs.zsh" ] && source "$HOME/.config/zsh/keybindings.emacs.zsh"
# Load aliases if existent.
[ -f "$HOME/.config/zsh/alias.zsh" ] && source "$HOME/.config/zsh/alias.zsh"
# Load enviorment variables
[ -f "$HOME/.zshenv" ] && source "$HOME/.zshenv"

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*' #Case insentive completion and more
zstyle ':completion:*' use-cache on
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.


# Fzf widgets for zsh
source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh


# Load zsh-syntax-highlighting and zsh-autosuggestions; should be last.
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null




