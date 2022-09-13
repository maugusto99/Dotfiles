### ADDING TO THE PATH
# First line removes the path; second line sets it.  Without the first line,
# your path gets massive and fish becomes very slow.

set XDG_CONFIG_HOME $HOME/.config
set XDG_CACHE_HOME $HOME/.cache
set XDG_DATA_HOME $HOME/.local/share

set -e fish_user_paths
set -U fish_user_paths $HOME/.local/bin /storage/Applications /storage/Applications/vaspkit.1.3.5/bin $fish_user_paths

### EXPORT ###
set -Ux fish_greeting # Supresses fish's intro message
set -Ux EDITOR nvim
set -Ux BROWSER firefox
set -Ux TERMINAL kitty
set -Ux LESSHISTFILE -
set -x LS_COLORS dir_colors.sh


### SET EITHER DEFAULT EMACS MODE OR VI MODE ###
function fish_user_key_bindings
    fish_default_key_bindings
end

#Aliases
# vim and emacs
alias vi="nvim"
alias vdiff="nvim -d"

# ls
alias ll='exa -alh --color=auto --group-directories-first'
alias la='exa -a --color=auto --icons --group-directories-first'
alias ls='exa --color=auto --icons --group-directories-first'

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

set fzf_history_opts --with-nth=4..
set -x FZF_DEFAULT_OPTS '
    --height=70%
    --color=fg:#e5e9f0,bg:#3b4252,hl:#81a1c1
    --color=fg+:#e5e9f0,bg+:#3b4252,hl+:#81a1c1
    --color=info:#eacb8a,prompt:#bf6069,pointer:#b48dac
    --color=marker:#a3be8b,spinner:#b48dac,header:#a3be8b'


# starship init fish | source

