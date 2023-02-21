function directory_open
  set -lx FZF_DEFAULT_COMMAND 'fd  --type d --strip-cwd-prefix --hidden --color never --exclude .git'
  set -l directories (fzf --exact --bind 'ctrl-y:execute-silent(echo -n {1..} | wl-copy)+abort'\
  --color header:italic --header 'Press CTRL-Y to copy path into clipboard')
  if test -n "$directories"
    echo {cd $directories} | read -l result
    commandline -- $result
  end
  commandline -f repaint
end

function editor_open
  set -lx FZF_DEFAULT_COMMAND "fd --type f --strip-cwd-prefix --hidden --color never --exclude '.git*' --exclude '*icons' --exclude '*cache' "
  set -l files (fzf --exact --preview 'bat -n --color=always {}' --multi \
  --bind 'alt-p:change-preview-window(hidden|)' \
  --bind 'ctrl-y:execute-silent(echo -n {1..} | wl-copy)+abort'\
  --color header:italic --header 'Press CTRL-Y to copy path into clipboard')
  if test -n "$files"
    echo $EDITOR $files | read -l result
    commandline -- $result
  end
  commandline -f repaint
end


function history_search -d "Show command history"
  set -lx FZF_DEFAULT_OPTS "$FZF_DEFAULT_OPTS --exact --scheme=history --bind=ctrl-r:toggle-sort,ctrl-z:ignore
  --preview 'echo {}' --preview-window down:3:hidden:wrap
  --bind 'alt-p:toggle-preview'
  --bind 'ctrl-y:execute-silent(echo -n {1..} | wl-copy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"

  if history -z | fzf --read0 --print0 | read -lz result
    and commandline -- $result
  end
  commandline -f repaint
end

bind \e\cf editor_open
bind \cr history_search
bind \e\cd directory_open
