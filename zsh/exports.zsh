# Exports

# Basics
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
# Variables
#export TERM="xterm-256color"
export EDITOR="nvim"
export VISUAL="nvim"
export BROWSER="brave"
export TERMINAL="konsole"
export PATH=/home/augustom/.local/bin:$PATH
export PATH=$XDG_CONFIG_HOME/emacs/bin:$PATH
export PATH=/storage/Applications/vaspkit.1.3.5/bin:$PATH
eval $(dircolors $XDG_CONFIG_HOME/zsh/dir_colors)
# Misc
export LESSHISTFILE=-
 
# fzf variables
# export FZF_DEFAULT_COMMAND='fd --type f --color=never --hidden'
export FZF_DEFAULT_COMMAND='command find . -type f -prune 2> /dev/null'
export FZF_DEFAULT_OPTS='--height=70%'
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
  --layout reverse
  --color=bg+:#3c3836,bg:#1d2021,spinner:#8ec07c,hl:#83a598
  --color=fg:#bdae93,header:#83a598,info:#fabd2f,pointer:#8ec07c
  --color=marker:#8ec07c,fg+:#ebdbb2,prompt:#fabd2f,hl+:#83a598'
#     --color=fg:#e5e9f0,bg:#3b4252,hl:#81a1c1
#     --color=fg+:#e5e9f0,bg+:#3b4252,hl+:#81a1c1
#     --color=info:#eacb8a,prompt:#bf6069,pointer:#b48dac
#     --color=marker:#a3be8b,spinner:#b48dac,header:#a3be8b'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# export FZF_CTRL_T_OPTS="--preview 'bat --color=always --line-range :50 {} --theme=gruvbox-dark'"
export FZF_CTRL_T_OPTS="--preview ''"
# export FZF_ALT_C_COMMAND='fd --type d . --color=never --hidden'
