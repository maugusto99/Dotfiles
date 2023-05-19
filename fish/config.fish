set -Ux fish_user_paths
# Path
fish_add_path ~/.local/bin
fish_add_path /bin
fish_add_path /var/lib/flatpak/exports/bin/
fish_add_path /storage/Applications/vaspkit.1.4.0/bin

### EXPORT ###
set -Ux fish_greeting # Supresses fish's intro message
set -Ux EDITOR nvim
set -Ux BROWSER firefox
set -Ux TERMINAL kitty
set -Ux LESSHISTFILE -
set -Ux MANPAGER "nvim +Man!"
set -Ux PAGER "bat -p"
set -Ux FZF_DEFAULT_COMMAND 'fd --strip-cwd-prefix '

#Aliases
abbr vi nvim
abbr vimdiff nvim -d

# test -f $XDG_CONFIG_HOME/fish/themes/Tokyonight.fish && source $XDG_CONFIG_HOME/fish/themes/Tokyonight.fish
test -f $XDG_CONFIG_HOME/fish/themes/Gruvbox.fish && source $XDG_CONFIG_HOME/fish/themes/Gruvbox.fish

bind \e\cf '__fzf_files'
bind \cr '__fzf_history'
# bind \ct '__init_tmux'
bind \e\cd '__fzf_directories'


test -e /usr/bin/zoxide && zoxide init fish | source
test -e /usr/bin/starship && starship init fish | source
