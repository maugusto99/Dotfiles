function ls --wraps='eza --icons=always' --wraps='eza -v --icons=always' --wraps='eza --icons=always --group-directories-first' --description 'alias ls=eza --icons=always --group-directories-first'
    eza --icons=always --group-directories-first $argv

end
