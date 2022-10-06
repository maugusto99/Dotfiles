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
    fzf_key_bindings
end

#Aliases
# vim 
alias vi="nvim"

# ls
alias ll='exa -alh --color=auto --group-directories-first'
alias la='exa -a --color=auto --group-directories-first --icons'
alias ls='exa --color=auto --group-directories-first --icons'

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
alias wget="wget --hsts-file=$XDG_CACHE_HOME/wget-hsts"

set -x FZF_DEFAULT_COMMAND 'fd --strip-cwd-prefix '
set -x FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND '--hidden --type f'
set -x FZF_ALT_C_COMMAND $FZF_DEFAULT_COMMAND '--hidden --type d'
# set -x FZF_DEFAULT_OPTS '
#     --height=70%
#     --layout reverse
#     --color fg:#D8DEE9,bg:#2E3440,hl:#A3BE8C,fg+:#D8DEE9,bg+:#434C5E,hl+:#A3BE8C
#     --color pointer:#BF616A,info:#4C566A,spinner:#4C566A,header:#4C566A,prompt:#81A1C1,marker:#EBCB8B'
set -x FZF_DEFAULT_OPTS ' 
  --height=70%
  --layout reverse
	--color=fg:#c0caf5,bg:#1a1b26,hl:#bb9af7
	--color=fg+:#c0caf5,bg+:#1a1b26,hl+:#7dcfff
	--color=info:#7aa2f7,prompt:#7dcfff,pointer:#7dcfff 
	--color=marker:#9ece6a,spinner:#9ece6a,header:#9ece6a'

zoxide init fish | source
