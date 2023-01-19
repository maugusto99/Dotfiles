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
set -Ux TERMINAL alacritty
set -Ux LESSHISTFILE -
set -Ux MANPAGER "nvim +Man!"

function fish_user_key_bindings
  fish_default_key_bindings
  fzf_key_bindings
end


#Aliases
alias vi="nvim"

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
alias bat='bat --theme base16'
alias ag="ase gui"
alias wget="wget --hsts-file=$XDG_CACHE_HOME/wget-hsts"

# EXPORTS
set -x FZF_DEFAULT_COMMAND 'fd --strip-cwd-prefix'
set -x FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND '--hidden --type f --no-ignore-vcs'
set -x FZF_ALT_C_COMMAND $FZF_DEFAULT_COMMAND '--hidden --type d --no-ignore-vcs'

bind -e \ct fzf-file-widget
bind -e \cr fzf-history-widget
bind -e \ec fzf-cd-widget

bind \e\cf fzf-file-widget
bind \cr fzf-history-widget
bind \e\cd fzf-cd-widget

# set -x FZF_DEFAULT_OPTS '
# --height=70%
# --layout reverse
# --color=fg:#c0caf5,bg:#1a1b26,hl:#bb9af7
# --color=fg+:#c0caf5,bg+:#1a1b26,hl+:#7dcfff
# --color=info:#7aa2f7,prompt:#7dcfff,pointer:#7dcfff
# --color=marker:#9ece6a,spinner:#9ece6a,header:#9ece6a'

set -x FZF_DEFAULT_OPTS '
--height=70%
--layout reverse
--bind ctrl-h:toggle-preview
--color=bg+:#3c3836,bg:#1d2021,spinner:#8ec07c,hl:#83a598
--color=fg:#bdae93,header:#83a598,info:#fabd2f,pointer:#8ec07c
--color=marker:#8ec07c,fg+:#ebdbb2,prompt:#fabd2f,hl+:#83a598'

# set -x FZF_DEFAULT_OPTS '
# --height=70%
# --layout reverse
# --bind ctrl-h:toggle-preview
# --color fg:#D8DEE9,bg:#2E3440,hl:#A3BE8C,fg+:#D8DEE9,bg+:#434C5E,hl+:#A3BE8C
# --color pointer:#BF616A,info:#4C566A,spinner:#4C566A,header:#4C566A,prompt:#81A1C1,marker:#EBCB8B'

# fzf.fish
# set fzf_fd_opts --hidden --exclude=.git --strip-cwd-prefix
# set fzf_history_opts --with-nth=4..
# set fzf_dir_opts --bind "ctrl-o:execute($EDITOR {} &> /dev/tty)"
# set fzf_directory_opts --preview ""

test -e /usr/bin/zoxide && zoxide init fish | source

test -e /usr/local/bin/starship && starship init fish | source

