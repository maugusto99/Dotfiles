set -gx fish_greeting # Supresses fish's intro message
set -x fish_user_paths
set -Ux fish_colorscheme "Catppuccin Mocha"

fish_add_path -a ~/.local/bin

### Global Variables
set -gx EDITOR nvim
set -gx BROWSER firefox
set -gx TERMINAL kitty
set -gx LESSHISTFILE -
set -gx FZF_DEFAULT_COMMAND "fd --strip-cwd-prefix "
set -gx PAGER "bat -p"
set -gx LESS -R
set -gx MANPAGER "sh -c 'col -bx | bat -l man -p --color=always'"
set -gx MANROFFOPT -c

abbr vi nvim
abbr vimdiff nvim -d

bind \e\cf __fzf_files
bind \cr __fzf_history
bind \e\cd __fzf_directories
bind \e\cy yazi


test -e (which starship) && starship init fish | source
test -e (which zoxide) && zoxide init fish | source
