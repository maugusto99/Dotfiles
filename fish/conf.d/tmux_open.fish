function tmux_open
  tmux a 2> /dev/null || tmux
  commandline -f repaint
end

bind \ct tmux_open
