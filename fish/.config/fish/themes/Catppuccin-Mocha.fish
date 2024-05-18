# name: 'Catppuccin mocha'
# url: 'https://github.com/catppuccin/fish'
# preferred_background: 1e1e2e

set -l fish_color_normal cdd6f4
set -l fish_color_command 89b4fa
set -l fish_color_param f2cdcd
set -l fish_color_keyword f38ba8
set -l fish_color_quote a6e3a1
set -l fish_color_redirection f5c2e7
set -l fish_color_end fab387
set -l fish_color_comment 7f849c
set -l fish_color_error f38ba8
set -l fish_color_gray 6c7086
set -l fish_color_selection --background=313244
set -l fish_color_search_match --background=313244
set -l fish_color_operator f5c2e7
set -l fish_color_escape eba0ac
set -l fish_color_autosuggestion 6c7086
set -l fish_color_cancel f38ba8
set -l fish_color_cwd f9e2af
set -l fish_color_user 94e2d5
set -l fish_color_host 89b4fa
set -l fish_color_host_remote a6e3a1
set -l fish_color_status f38ba8
set -l fish_pager_color_progress 6c7086
set -l fish_pager_color_prefix f5c2e7
set -l fish_pager_color_completion cdd6f4
set -l fish_pager_color_description 6c7086


set -Ux FZF_DEFAULT_OPTS "\
--height=90%
--layout reverse
--pointer "➜"
--cycle  --inline-info
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

