function __init_tmux  --description 'init tmux'
  tmux a || tmux 2> /dev/null
end
