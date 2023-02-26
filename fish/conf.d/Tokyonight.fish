# TokyoNight Color Palette
set -l foreground c0caf5
set -l selection 33467c
set -l comment 565f89
set -l red f7768e
set -l orange ff9e64
set -l yellow e0af68
set -l green 9ece6a
set -l purple 9d7cd8
set -l cyan 7dcfff
set -l pink bb9af7

# Syntax Highlighting Colors
set -g fish_color_normal $foreground
set -g fish_color_command $cyan
set -g fish_color_keyword $pink
set -g fish_color_quote $yellow
set -g fish_color_redirection $foreground
set -g fish_color_end $orange
set -g fish_color_error $red
set -g fish_color_param $purple
set -g fish_color_comment $comment
set -g fish_color_selection --background=$selection
set -g fish_color_search_match --background=$selection
set -g fish_color_operator $green
set -g fish_color_escape $pink
set -g fish_color_autosuggestion $comment

# Completion Pager Colors
set -g fish_pager_color_progress $comment
set -g fish_pager_color_prefix $cyan
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $comment
set -g fish_pager_color_selected_background --background=$selection


set -x FZF_DEFAULT_OPTS '
--height=80%
--layout reverse
--cycle --border --inline-info
--color=fg:#c0caf5,bg:#1a1b26,hl:#bb9af7
--color=fg+:#c0caf5,bg+:#1a1b26,hl+:#7dcfff
--color=info:#7aa2f7,prompt:#7dcfff,pointer:#7dcfff
--color=marker:#9ece6a,spinner:#9ece6a,header:#9ece6a'

