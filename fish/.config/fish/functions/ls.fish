function ls --wraps='exa --color=auto --group-directories-first --icons' --wraps=lsd --wraps='exa --icons --group-directories-first' --description 'alias ls=lsd'
  lsd -v $argv

end
