### ADDING TO THE PATH
# First line removes the path; second line sets it.  Without the first line,
# your path gets massive and fish becomes very slow.

set -e fish_user_paths
set -x XDG_CONFIG_HOME $HOME/.config
set -x XDG_CACHE_HOME $HOME/.cache
set -x XDG_DATA_HOME $HOME/.local/share
set -x fish_user_paths $HOME/.local/bin /storage/Applications/vaspkit.1.3.5/bin $XDG_CONFIG_HOME/spicetify $fish_user_paths


### EXPORT ###
set -Ux fish_greeting # Supresses fish's intro message
set -Ux EDITOR nvim
set -Ux BROWSER firefox
set -Ux TERMINAL kitty
set -Ux LESSHISTFILE -
set -Ux MANPAGER "nvim +Man!"


#Aliases
abbr vi nvim
abbr vimdiff nvim -d

if test -e /usr/bin/exa
  alias ll='exa -alh --color=auto --group-directories-first'
  alias la='exa -a --color=auto --group-directories-first --icons'
  alias ls='exa --color=auto --group-directories-first --icons'
end

if test -e /usr/bin/rg
  alias grep='rg -N'
end

alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'
alias wget="wget --hsts-file=$XDG_CACHE_HOME/wget-hsts"
alias gdu="gdu --no-color"
alias pkgsearch="apt-cache pkgnames --quiet | fzf | xargs nala show -v"
test "$TERM" = "xterm-kitty" && alias ssh="kitty +kitten ssh"

# EXPORTS
set -x FZF_DEFAULT_COMMAND 'fd --strip-cwd-prefix --hidden '

test -e $XDG_CONFIG_HOME/fish/themes/Tokyonight.fish && source $XDG_CONFIG_HOME/fish/themes/Tokyonight.fish

# set -x FZF_DEFAULT_OPTS '
# --height=70%
# --layout reverse
# --bind ctrl-h:toggle-preview
# --color=bg+:#3c3836,bg:#1d2021,spinner:#8ec07c,hl:#83a598
# --color=fg:#bdae93,header:#83a598,info:#fabd2f,pointer:#8ec07c
# --color=marker:#8ec07c,fg+:#ebdbb2,prompt:#fabd2f,hl+:#83a598'


test -e /usr/bin/zoxide && zoxide init fish | source

test -e /usr/local/bin/starship && starship init fish | source

