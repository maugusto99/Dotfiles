### ADDING TO THE PATH
# First line removes the path; second line sets it.  Without the first line,
# your path gets massive and fish becomes very slow.

set -e fish_user_paths
set -U fish_user_paths $HOME/.local/bin /storage/Applications/vaspkit.1.3.5/bin $XDG_CONFIG_HOME/emacs/bin $XDG_CONFIG_HOME/spicetify $fish_user_paths

set XDG_CONFIG_HOME $HOME/.config
set XDG_CACHE_HOME $HOME/.cache
set XDG_DATA_HOME $HOME/.local/share

### EXPORT ###
set -Ux fish_greeting # Supresses fish's intro message
set -Ux EDITOR nvim
set -Ux BROWSER firefox
set -Ux TERMINAL konsole
set -Ux LESSHISTFILE -
# (dircolors $XDG_CONFIG_HOME/fish/dir_colors)

### SET EITHER DEFAULT EMACS MODE OR VI MODE ###

function fish_user_key_bindings
    fish_default_key_bindings
    fzf_key_bindings
end

# source /usr/share/fish/vendor_functions.d/fzf-key-bindings.fish

#Aliases
# vim 
alias vi="nvim"
alias wezterm="org.wezfurlong.wezterm"

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
# Nord
# set -x FZF_DEFAULT_OPTS ' 
#   --height=70%
#   --layout reverse
#   --color=bg+:#3B4252,bg:#2E3440,spinner:#81A1C1,hl:#616E88
#   --color=fg:#D8DEE9,header:#616E88,info:#81A1C1,pointer:#81A1C1
#   --color=marker:#81A1C1,fg+:#D8DEE9,prompt:#81A1C1,hl+:#81A1C1'

# Gruvbox
set -x FZF_DEFAULT_OPTS ' 
  --height=70%
  --layout reverse
  --color=bg+:#3c3836,bg:#1d2021,spinner:#8ec07c,hl:#83a598
  --color=fg:#bdae93,header:#83a598,info:#fabd2f,pointer:#8ec07c
  --color=marker:#8ec07c,fg+:#ebdbb2,prompt:#fabd2f,hl+:#83a598'

set -x FZF_CTRL_T_OPTS "--preview ''"

if test -e /usr/bin/zoxide
  zoxide init fish | source
end

if test -e /usr/bin/starship
  starship init fish | source
end
