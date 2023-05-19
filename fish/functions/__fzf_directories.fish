#! /usr/bin/env fish

function __fzf_directories -d "Search Directories with fzf"
  set -lx FZF_DEFAULT_COMMAND 'fd  --type d --strip-cwd-prefix --hidden --color never --exclude .git'
  set -l directories (fzf  --exact --bind 'ctrl-y:execute-silent(echo -n {1..} | $clipboard)+abort' \
  --prompt='Search Directories> ' \
  --info=hidden \
  --preview 'exa -T --color=always --icons {}' \
  --color header:italic --header 'Press CTRL-Y to copy path into clipboard')
  if test -n "$directories"
    echo {cd $directories} | read -l result
    commandline -- $result
  end
  commandline -f repaint
end
