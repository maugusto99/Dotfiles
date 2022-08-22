# KEYBINDINGS FOR ZSHELL

# Emacs mode
bindkey -e

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







