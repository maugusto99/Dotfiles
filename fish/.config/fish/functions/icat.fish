function icat --description 'alias icat=kitten icat'
    switch $TERM
        case xterm-kitty
            kitten icat $argv
        case wezterm
            wezterm imgcat $argv
        case '*'
            echo "Not using a terminal with image support"
    end
end
