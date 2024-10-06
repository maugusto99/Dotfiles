function ssh --description "alias ssh=kitty +kitten ssh"
  if test "$TERM" = "xterm-kitty"
    kitty +kitten ssh $argv
  else
     /bin/ssh $argv
  end
end
