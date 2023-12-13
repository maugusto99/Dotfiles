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
export PATH=/storage/Applications/vaspkit.1.3.5/bin:$PATH
eval $(dircolors -b)
# Misc
export LESSHISTFILE=-

# fzf variables
export FZF_DEFAULT_COMMAND='fd --type f --color=never --hidden'
export FZF_DEFAULT_OPTS='--height=70%'

export FZF_DEFAULT_OPTS="\
--height=90% \
--layout reverse \
--pointer "➜" \
--cycle  --inline-info \
--color=bg+:#1e1e2e,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"


setopt BANG_HIST              # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY       # Write the history file in the ':start:elapsed;command' format.
setopt SHARE_HISTORY          # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS       # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS   # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS      # Do not display a previously found event.
setopt HIST_IGNORE_SPACE      # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS      # Do not write a duplicate event to the history file.
setopt HIST_VERIFY            # Do not execute immediately upon history expansion.
setopt HIST_BEEP              # Beep when accessing non-existent history.


HISTFILE="$HOME/.config/zsh/.zsh_history" # The path to the history file.
HISTSIZE=10000                                         # The maximum number of events to save in the internal history.
SAVEHIST=$HISTSIZE                                     # The maximum number of events to save in the history file.


