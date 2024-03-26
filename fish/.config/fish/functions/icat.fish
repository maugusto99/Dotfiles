function icat --description 'alias icat=kitten icat'
  if test $TERM = "xterm-kitty"
    kitten icat $argv
  else
    echo "Not using kitty terminal"
  end
end
