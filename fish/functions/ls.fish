function ls --wraps='exa --color=auto --group-directories-first --icons' --description 'alias ls=exa --color=auto --group-directories-first --icons'
  exa --color=auto --group-directories-first --icons $argv

end
