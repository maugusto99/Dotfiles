# Sensible Bash - An attempt at saner Bash defaults
# Maintainer: mrzool <http://mrzool.cc>
# Repository: https://github.com/mrzool/bash-sensible
# Version: 0.2.2

## GENERAL OPTIONS ##

# Update window size after every command
shopt -s checkwinsize

# Automatically trim long paths in the prompt (requires Bash 4.x)
PROMPT_DIRTRIM=2
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# Enable history expansion with space
# E.g. typing !!<space> will replace the !! with your last command
bind Space:magic-space

# Turn on recursive globbing (enables ** to recurse all directories)
shopt -s globstar 2>/dev/null

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

## SMARTER TAB-COMPLETION (Readline bindings) ##

# Perform file completion in a case insensitive fashion
bind "set completion-ignore-case on"

# Treat hyphens and underscores as equivalent
bind "set completion-map-case on"

# Display matches for ambiguous patterns at first tab press
bind "set show-all-if-ambiguous on"

# Immediately add a trailing slash when autocompleting symlinks to directories
bind "set mark-symlinked-directories on"

## SANE HISTORY DEFAULTS ##

# Append to the history file, don't overwrite it
shopt -s histappend

# Save multi-line commands as one command
shopt -s cmdhist

# Record each line as it gets issued
PROMPT_COMMAND='history -a'

# Huge history. Doesn't appear to slow things down, so why not?
HISTSIZE=500000
HISTFILESIZE=100000

# Avoid duplicate entries
HISTCONTROL="erasedups:ignoreboth"

# Don't record some commands
export HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history:clear"

# Use standard ISO 8601 timestamp
# %F equivalent to %Y-%m-%d
# %T equivalent to %H:%M:%S (24-hours format)
HISTTIMEFORMAT='%F %T '

# Enable incremental history search with up/down arrows (also Readline goodness)
# Learn more about this here: http://codeinthehole.com/writing/the-most-important-command-line-tip-incremental-history-searching-with-inputrc/
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\e[C": forward-char'
bind '"\e[D": backward-char'

## BETTER DIRECTORY NAVIGATION ##

# Prepend cd to directory names automatically
shopt -s autocd 2>/dev/null
# Correct spelling errors during tab-completion
shopt -s dirspell 2>/dev/null
# Correct spelling errors in arguments supplied to cd
shopt -s cdspell 2>/dev/null

# This allows you to bookmark your favorite places across the file system
# Define a variable containing a path and you will be able to cd into it regardless of the directory you're in
shopt -s cdable_vars

# Examples:

# export projects="$HOME/projects"
# export documents="$HOME/Documents"
# export dropbox="$HOME/Dropbox"

eval "$(dircolors -b)"

#Aliases
alias ls='ls -v --color=auto'
alias ll='ls -Alhv --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias lspkgs="dpkg-query -W | column -t $argv"
alias searchpkgs="apt-cache pkgnames | fzf --exact | xargs nala show $argv"

# Exports
export PATH=/home/augustom/.local/bin:$PATH

if [[ -f $(which nvim) ]]; then
	export EDITOR=nvim
else
	export EDITOR=vim
fi

alias vi=$EDITOR
export BROWSER=firefox
export TERMINAL=konsole
export LESSHISTFILE="-"
export MOZ_ENABLE_WAYLAND=1
export GTK_USE_PORTAL=1
export PAGER="less -Ri"

# Use bash-completion, if available

[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] &&
	. /usr/share/bash-completion/bash_completion

### FZF variables
[ -f /usr/share/doc/fzf/examples/key-bindings.bash ] && source /usr/share/doc/fzf/examples/key-bindings.bash

export FZF_DEFAULT_COMMAND='fd --type f --color=never --hidden --no-follow'
export FZF_COMPLETION_OPTS="--exact --border"

[ -f /usr/share/bash-completion/completions/fzf ] && source /usr/share/bash-completion/completions/fzf

_fzf_compgen_path() {
	fd --hidden --no-follow
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
	fd --type d --hidden --no-follow
}
export FZF_DEFAULT_OPTS="\
--height=90% \
--layout reverse \
--pointer "➜" \
--cycle  --inline-info \
--color=bg+:#1e1e2e,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

### NNN
export NNN_OPENER=nvim
export NNN_PLUG='f:finder;p:preview-tui;d:diffs;c:fzcd;z:autojump;g:getplugs'
export NNN_OPTS="AdeiuHUQx"
export NNN_FCOLORS=030304020000060801030500 # filetype colors. this mimics dircolors
export LESSUTFCHARDEF="E000-F8FF:p,F0000-FFFFD:p,100000-10FFFD:p"
export NNN_TRASH=1
