set -gx fish_greeting # Supresses fish's intro message
set -x fish_user_paths

fish_add_path -a ~/.local/bin

##Global Variables
set -gx EDITOR nvim
set -gx BROWSER "flatpak run org.mozilla.firefox"
set -gx TERMINAL wezterm
set -gx LESSHISTFILE -
set -gx BAT_THEME Catppuccin-mocha
set -gx FZF_DEFAULT_COMMAND "fd --strip-cwd-prefix "
set -gx PAGER "bat -p"
set -gx LESS "-R"
set -gx MANPAGER "nvim +Man!"

###NNN
set -gx NNN_OPENER nvim
set -gx NNN_PLUG 'f:finder;p:preview-tui;d:diffs;c:fzcd;z:autojump;g:git-changes'
set -gx NNN_OPTS "aAdeiuHUQx"
set -gx NNN_FCOLORS 030304020000060801030500 # filetype colors. this mimics dircolors
set -gx LESSUTFCHARDEF "E000-F8FF:p,F0000-FFFFD:p,100000-10FFFD:p"
set -gx NNN_TRASH 1
abbr n nnn

abbr vi nvim
abbr vimdiff nvim -d

test -f ~/.config/fish/themes/Catppuccin-Mocha.fish && source ~/.config/fish/themes/Catppuccin-Mocha.fish
# test -f ~/.config/fish/themes/Tokyonight.fish && source ~/.config/fish/themes/Tokyonight.fish

bind \e\cf __fzf_files
bind \cr __fzf_history
bind \e\cd __fzf_directories


test -e (which zoxide) && zoxide init fish | source
test -e (which starship) && starship init fish | source
