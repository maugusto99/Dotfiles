### ADDING TO THE PATH
# First line removes the path; second line sets it.  Without the first line,
# your path gets massive and fish becomes very slow.

set -e fish_user_paths
set -x fish_user_paths $HOME/.local/bin /storage/Applications/vaspkit.1.3.5/bin $XDG_CONFIG_HOME/spicetify $fish_user_paths

set XDG_CONFIG_HOME $HOME/.config
set XDG_CACHE_HOME $HOME/.cache
set XDG_DATA_HOME $HOME/.local/share

### EXPORT ###
set -Ux fish_greeting # Supresses fish's intro message
set -Ux EDITOR nvim
set -Ux BROWSER firefox
set -Ux TERMINAL alacritty
set -Ux LESSHISTFILE -

### SET EITHER DEFAULT EMACS MODE OR VI MODE ###

function fish_user_key_bindings
    fish_default_key_bindings
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
  alias egrep='erg -N'
  alias fgrep='frg -N'
end

alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

alias bat="bat --theme=base16"
test -e /bin/bat && set -x MANPAGER "sh -c 'col -bx | bat -l man -p '"
alias ag="ase gui"
alias wget="wget --hsts-file=$XDG_CACHE_HOME/wget-hsts"
alias wezterm="flatpak run org.wezfurlong.wezterm"

# EXPORTS
# set -x FZF_DEFAULT_COMMAND 'fd --strip-cwd-prefix '
# set -x FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND '--hidden --type f --no-ignore-vcs'
# set -x FZF_ALT_C_COMMAND $FZF_DEFAULT_COMMAND '--hidden --type d --no-ignore-vcs'
# set -x FZF_CTRL_T_OPTS "--preview ''"

set -x FZF_DEFAULT_OPTS '
--height=70%
--layout reverse
--bind ctrl-h:toggle-preview
--color=fg:#c0caf5,bg:#1a1b26,hl:#bb9af7
--color=fg+:#c0caf5,bg+:#1a1b26,hl+:#7dcfff
--color=info:#7aa2f7,prompt:#7dcfff,pointer:#7dcfff
--color=marker:#9ece6a,spinner:#9ece6a,header:#9ece6a'

# fzf.fish
set fzf_fd_opts --hidden --exclude=.git
set fzf_history_opts --with-nth=4..
set fzf_dir_opts --bind "ctrl-o:execute($EDITOR {} &> /dev/tty)"
# set fzf_directory_opts --preview ""

bind \ct 'tmux a || tmux'
test -e /usr/bin/zoxide && zoxide init fish | source

test -e /usr/bin/starship && starship init fish | source

