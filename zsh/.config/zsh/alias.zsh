#Aliases
# vim
alias vi="nvim"
alias vdiff="nvim -d"

# ls
alias ll='ls -alh --color=auto'
alias la='ls -a --color=auto'
alias ls='ls --color=auto '

alias .1='cd ..'
alias .2='cd ../..'
alias .3='cd ../../../'

# Colorize grep output (good for log files)
alias grep='rg --color=auto'
alias egrep='rg -e --color=auto'
alias fgrep='rg -f --color=auto'

# confirm before overwriting something
alias cp="cp -i"
alias mi='mv -i'
alias ri='rm -i'

# change bat for cat
alias cat="bat"

alias wget="wget --hsts-file=$XDG_CACHE_HOME/wget-hsts"

