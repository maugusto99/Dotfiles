# Enable colors and change prompt:
autoload -U colors && colors
# options 
setopt autocd menu_complete
PROMPT="%B%F{red}[%f%b%B%F{magenta}%n%f%b%B%F{yellow}@%f%b%B%F{cyan}%2~%f%b%B%F{red}]%f%b "

# Load shortcuts if existent.
[ -f "$HOME/.config/zsh/keybindings.emacs.zsh" ] && source "$HOME/.config/zsh/keybindings.emacs.zsh"
# Load aliases if existent.
[ -f "$HOME/.config/zsh/alias.zsh" ] && source "$HOME/.config/zsh/alias.zsh"
# Load exports if existent.
[ -f "$HOME/.config/zsh/exports.zsh" ] && source "$HOME/.config/zsh/exports.zsh"
# Load enviorment variables.
[ -f "$HOME/.zshenv" ] && source "$HOME/.zshenv"

# History in cache directory:
export HISTORY_IGNORE="(ls|cd|pwd|exit|reboot|history|cd -|cd ..)"
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=$ZDOTDIR/.zsh_history


# Completion options
autoload -U compinit
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS} # add colors to completion
zstyle ':completion:*' menu select # select through the menu
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*' # Case insentive completion and more
zstyle ':completion:*' use-cache on # cache the results for more efficient search
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache" # storage the cache in .zcompcache file
zmodload zsh/complist
compinit
_comp_options+=(globdots) # Include hidden files.

# Fzf widgets for zsh
source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh

# Load zsh-syntax-highlighting and zsh-autosuggestions; should be last.
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
