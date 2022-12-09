# Enable colors and change prompt:
autoload -U colors && colors

PROMPT="%B%F{red}[%f%b%B%F{green}%n%f%b%B%F{yellow}@%f%b%B%F{cyan}%2~%f%b%B%F{red}]%f%b "

# options 
setopt autocd menu_complete
setopt alwaystoend
setopt appendhistory
setopt autocd
setopt autolist
setopt automenu
setopt autopushd
setopt completeinword
setopt correct
setopt extendedhistory
setopt histexpiredupsfirst
setopt histignoredups
setopt histignorespace
setopt histverify
setopt interactivecomments
setopt listpacked
setopt longlistjobs
setopt nocaseglob
setopt noflowcontrol
setopt promptsubst
setopt pushdignoredups
setopt pushdminus
setopt sharehistory

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

autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey -e
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end
bindkey '\e[H' beginning-of-line
bindkey '\e[F' end-of-line
bindkey ";5D" backward-word
bindkey ";5C" forward-word
bindkey "^U" backward-kill-line

# Make backward-word stop in WORDCHARS
export WORDCHARS='*?_[]~=&;!#$%^(){}'
tcsh-backward-word() {
  local WORDCHARS="${WORDCHARS:s@/@}"
  zle backward-word
}
zle -N tcsh-backward-word

# Completion options
# zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*' # Case insentive completion and more
# zstyle ':completion:*' special-dirs true # select through the menu
# zmodload zsh/complist
# autoload -Uz compinit && compinit -i
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' completions 1
zstyle ':completion:*' glob 1
zstyle ':completion:*' group-name ''
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'
zstyle ':completion:*' max-errors 1
zstyle ':completion:*' menu select=0
zstyle ':completion:*' original true
zstyle ':completion:*' prompt 'Did you mean?'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' verbose true
zstyle ':completion:*' use-cache on # cache the results for more efficient search
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache" # storage the cache in .zcompcache file
_comp_options+=(globdots) # Include hidden files.
autoload -Uz compinit
compinit

# Fzf widgets for zsh
source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh

# Load zsh-syntax-highlighting and zsh-autosuggestions; should be last.
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

