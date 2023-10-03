set -gx fish_greeting # Supresses fish's intro message
set -x fish_user_paths

fish_add_path -a ~/.local/bin

set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx BROWSER firefox
set -gx TERMINAL kitty
set -x LESSHISTFILE -
set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'"
set -gx MANROFFOPT -c
set -gx PAGER "bat -p"
set -gx BAT_THEME Catppuccin-mocha
set -gx FZF_DEFAULT_COMMAND 'fd --strip-cwd-prefix '


abbr vi nvim
abbr vimdiff nvim -d

test -f ~/.config/fish/themes/Catppuccin-Mocha.fish && source ~/.config/fish/themes/Catppuccin-Mocha.fish
# test -f ~/.config/fish/themes/Tokyonight.fish && source ~/.config/fish/themes/Tokyonight.fish

bind \e\cf __fzf_files
bind \cr __fzf_history
bind \e\cd __fzf_directories

test -e /usr/bin/zoxide && zoxide init fish | source
# test -e (command -a starship) && starship init fish | source
starship init fish | source
