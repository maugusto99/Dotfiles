function ll --wraps='lsd -al' --wraps='exa -al --icons --group-directories-first' --description 'alias ll=exa -al --icons --group-directories-first'
  exa -al --icons --group-directories-first $argv
        
end
