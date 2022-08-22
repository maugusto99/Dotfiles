#Aliases
# vim and emacs
alias vi="nvim"
alias vdiff="nvim -d"


# ls
alias ll='exa -alh --color=auto --group-directories-first' # my preferred listing
alias la='exa -a --color=auto --group-directories-first'  # all files and dirs
alias ls='exa --color=auto --group-directories-first'  # visible files

alias .1='cd ..'
alias .2='cd ../..'
alias .3='cd ../../../'

# Colorize grep output (good for log files)
alias grep='rg --color=auto'
alias egrep='rg -e --color=auto'
alias fgrep='rg -f --color=auto'

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

# change bat for cat
alias cat="bat --theme=Nord"
alias ag="ase gui"
alias vesta="/storage/Applications/VESTA-gtk3/VESTA"

alias wget="wget --hsts-file=$XDG_CACHE_HOME/wget-hsts"

