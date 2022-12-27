### ADDING TO THE PATH
# First line removes the path; second line sets it.  Without the first line,
# your path gets massive and fish becomes very slow.

set -e fish_user_paths
set -U fish_user_paths $HOME/.local/bin /storage/Applications/vaspkit.1.3.5/bin $XDG_CONFIG_HOME/spicetify $fish_user_paths

set XDG_CONFIG_HOME $HOME/.config
set XDG_CACHE_HOME $HOME/.cache
set XDG_DATA_HOME $HOME/.local/share

### EXPORT ###
set -Ux fish_greeting # Supresses fish's intro message
set -Ux EDITOR nvim
set -Ux BROWSER firefox
set -Ux TERMINAL alacritty
set -Ux LESSHISTFILE -
set -x MANPAGER "sh -c 'col -bx | bat -l man -p --theme gruvbox-dark'"

### SET EITHER DEFAULT EMACS MODE OR VI MODE ###

function fish_user_key_bindings
    fish_default_key_bindings
    fzf_key_bindings
end

#Aliases
# vim
alias vi="nvim"

# exa for ls
if test -e /usr/bin/exa
  alias ll='exa -alh --color=auto --group-directories-first'
  alias la='exa -a --color=auto --group-directories-first --icons'
  alias ls='exa --color=auto --group-directories-first --icons'
end

# Colorize grep output (good for log files)
if test -e /usr/bin/rg
  alias grep='rg --pretty'
  alias egrep='erg --pretty'
  alias fgrep='frg --pretty'
end

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

# change bat for cat
alias bat="bat --theme=Nord"
# alias bat="bat --theme=gruvbox-dark"
alias ag="ase gui"
alias wget="wget --hsts-file=$XDG_CACHE_HOME/wget-hsts"

set -x FZF_DEFAULT_COMMAND 'fd --strip-cwd-prefix '
set -x FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND '--hidden --type f --no-ignore-vcs'
set -x FZF_ALT_C_COMMAND $FZF_DEFAULT_COMMAND '--hidden --type d --no-ignore-vcs'
set -x FZF_CTRL_T_OPTS "--preview ''"

# Gruvbox
# set -x FZF_DEFAULT_OPTS '
# --height=50%
# --layout reverse
# --color=bg+:#3c3836,bg:#1d2021,spinner:#8ec07c,hl:#83a598
# --color=fg:#bdae93,header:#83a598,info:#fabd2f,pointer:#8ec07c
# --color=marker:#8ec07c,fg+:#ebdbb2,prompt:#fabd2f,hl+:#83a598'

set -x FZF_DEFAULT_OPTS '
  --height=50%
  --layout reverse
	--color=fg:#c0caf5,bg:#1a1b26,hl:#bb9af7
	--color=fg+:#c0caf5,bg+:#1a1b26,hl+:#7dcfff
	--color=info:#7aa2f7,prompt:#7dcfff,pointer:#7dcfff
	--color=marker:#9ece6a,spinner:#9ece6a,header:#9ece6a'

test -e /usr/bin/zoxide && zoxide init fish | source

test -e /usr/bin/starship && starship init fish | source

