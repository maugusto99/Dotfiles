set -gx fish_greeting # Supresses fish's intro message
set -x fish_user_paths

fish_add_path -a ~/.local/bin

##Global Variables
set -gx EDITOR nvim
set -gx TERMINAL kitty
set -gx LESSHISTFILE -
set -gx BAT_THEME Catppuccin-mocha
set -gx FZF_DEFAULT_COMMAND "fd --strip-cwd-prefix "
set -gx PAGER "bat -p"
set -gx LESS -R
set -gx MANPAGER "sh -c 'col -bx | bat -l man -p --color=always'"
set -gx MANROFFOPT -c

###NNN
set -gx NNN_OPENER nvim
set -gx NNN_PLUG 'f:fd-finder;g:grep-finder;p:preview-tui;d:diffs;c:fzcd;z:autojump;x:perm-delete;e:suedit'
set -gx NNN_OPTS aAdeiuUQxH
set -gx NNN_FCOLORS 030304020000060801030500 # filetype colors. this mimics dircolors
set -gx LESSUTFCHARDEF "E000-F8FF:p,F0000-FFFFD:p,100000-10FFFD:p"
set -gx NNN_TRASH 2

abbr n nnn
abbr vi nvim
abbr vimdiff nvim -d

bind \e\cf __fzf_files
bind \cr __fzf_history
bind \e\cd __fzf_directories

set -Ux FZF_DEFAULT_OPTS "\
--layout reverse
--height=90%
--pointer "➜"
--cycle  --inline-info
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

test -e (which starship) && starship init fish | source
test -e (which zoxide) && zoxide init fish | source
