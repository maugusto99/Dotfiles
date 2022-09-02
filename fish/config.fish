### ADDING TO THE PATH
# First line removes the path; second line sets it.  Without the first line,
# your path gets massive and fish becomes very slow.

set XDG_CONFIG_HOME $HOME/.config
set XDG_CACHE_HOME $HOME/.cache
set XDG_DATA_HOME $HOME/.local/share

set -e fish_user_paths
set -U fish_user_paths $HOME/.local/bin /storage/Applications /storage/Applications/vaspkit.1.3.5/bin $fish_user_paths

### EXPORT ###
set -U fish_greeting # Supresses fish's intro message
# set TERM "xterm-256color"                         # Sets the terminal type
set -Ux EDITOR nvim # $EDITOR use Emacs in terminal
set BROWSER firefox
set TERMINAL alacritty
set LESSHISTFILE -


### SET EITHER DEFAULT EMACS MODE OR VI MODE ###
function fish_user_key_bindings
    fish_default_key_bindings
end

function fish_user_key_bindings
    fzf_key_bindings
end

set FZF_DEFAULT_OPTS '
    --height=50%
    --color=fg:#e5e9f0,bg:#3b4252,hl:#81a1c1
    --color=fg+:#e5e9f0,bg+:#3b4252,hl+:#81a1c1
    --color=info:#eacb8a,prompt:#bf6069,pointer:#b48dac
    --color=marker:#a3be8b,spinner:#b48dac,header:#a3be8b'

#Aliases
# vim and emacs
alias vi="nvim"
alias vdiff="nvim -d"

# ls
alias ll='exa -alh --color=auto --group-directories-first'
alias la='exa -a --color=auto --group-directories-first'
alias ls='exa --color=auto --group-directories-first'

# Colorize grep output (good for log files)
alias grep='rg --color=auto'
alias egrep='erg --color=auto'
alias fgrep='frg --color=auto'

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

# change bat for cat
alias cat="bat --theme=Nord"
alias ag="ase gui"
alias vesta="/storage/Applications/VESTA-gtk3/VESTA"
alias wget="wget --hsts-file=$XDG_CACHE_HOME/wget-hsts"

