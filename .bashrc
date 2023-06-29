# ~/.bashrc

# If not running interactively, don't do anything
# [[ $- != *i* ]] && return

PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
shopt -s cdspell
shopt -s autocd
shopt -s direxpand
shopt -s checkwinsize
shopt -s no_empty_cmd_completion
shopt -s histappend
if [ -f /usr/share/bash-completion/bash_completion ]; then
  source /usr/share/bash-completion/bash_completion
fi

eval "$(dircolors -b)"
HISTSIZE=
HISTFILESIZE=

#Aliases
alias ls='ls --color=auto'
alias ll='ls -Alh --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias vi='nvim'

# Exports
export GTK_USE_PORTAL=1
export PATH=/home/augustom/.local/bin:$PATH
export EDITOR=nvim
export VISUAL=nvim
export BROWSER=firefox
export TERMINAL=kitty
export LESSHISTFILE=-

# fzf variables
export FZF_DEFAULT_COMMAND='fd --type f --color=never --hidden'
