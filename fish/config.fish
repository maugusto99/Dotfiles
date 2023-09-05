set -gx fish_greeting # Supresses fish's intro message
set -gx EDITOR nvim
set -gx BROWSER firefox
set -gx TERMINAL kitty
set -gx LESSHISTFILE -
set -gx MANPAGER "nvim +Man!"
set -gx PAGER "bat -p"
set -gx FZF_DEFAULT_COMMAND 'fd --strip-cwd-prefix '
set -gx fish_user_paths
# Path
fish_add_path ~/.local/bin

### EXPORT ###

#Aliases
abbr vi nvim
abbr vimdiff nvim -d

# test -f ~/.config/fish/themes/Dracula.fish && source ~/.config/fish/themes/Dracula.fish
test -f ~/.config/fish/themes/Tokyonight.fish && source ~/.config/fish/themes/Tokyonight.fish

bind \e\cf '__fzf_files'
bind \cr '__fzf_history'
bind \e\cd '__fzf_directories'

test -e /usr/bin/zoxide && zoxide init fish | source
test -e /usr/local/bin/starship && starship init fish | source
