function ls --wraps='exa --color=auto --group-directories-first --icons' --wraps=lsd --wraps='exa --icons --group-directories-first' --description 'alias ls=exa --icons --group-directories-first'
  exa --icons --group-directories-first $argv
        
end
