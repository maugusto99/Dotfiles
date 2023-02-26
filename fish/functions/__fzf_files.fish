#! /usr/bin/env fish

function __fzf_files -d "Search files with fzf and open with $EDITOR"
  if test $XDG_SESSION_TYPE = wayland
    set clipboard "wl-copy"
  else
    set clipboard "xclip -i"
  end
  set -lx FZF_DEFAULT_COMMAND "fd --type f --strip-cwd-prefix --hidden --color never --exclude '.git*' --exclude '*icons' --exclude '*cache' "
  set -l files (fzf  --exact \
  --preview 'bat -n --color=always {}' --multi \
  --prompt='Search Files> ' \
  --info=hidden \
  --bind 'alt-p:change-preview-window(hidden|)' \
  --bind "ctrl-y:execute-silent(echo -n {1..} | $clipboard)+abort"\
  --color header:italic --header 'Press CTRL-Y to copy path into clipboard')
  if test -n "$files"
    echo $EDITOR $files | read -l result
    commandline -- $result
  end
  commandline -f repaint
end
