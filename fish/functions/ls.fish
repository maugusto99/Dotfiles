function ls --wraps='exa --color=auto --group-directories-first --icons' --wraps=lsd --description 'alias ls=lsd'
  lsd $argv
        
end
