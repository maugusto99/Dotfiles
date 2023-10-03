#! /usr/bin/env fish


function __fzf_history -d "Search through fish history"
    if test $XDG_SESSION_TYPE = wayland
        set clipboard wl-copy
    else
        set clipboard "xclip -i"
    end
    set -lx FZF_DEFAULT_OPTS "$FZF_DEFAULT_OPTS --exact --scheme=history
  --bind=ctrl-r:toggle-sort,ctrl-z:ignore
  --preview='echo {} | fish_indent --ansi ' \
  --preview-window down:4:wrap \
  --prompt='Search History> ' \
  --info=hidden\
  --multi \
  --bind 'alt-p:toggle-preview' \
  --bind 'ctrl-y:execute-silent(echo -n {1..} | $clipboard)+abort' \
  --color header:italic \
  --header 'Press CTRL-Y to copy command into clipboard'"

    if history -z | fzf --read0 --print0 | read -lz result
        and commandline -- $result
    end
    commandline -f repaint
end
