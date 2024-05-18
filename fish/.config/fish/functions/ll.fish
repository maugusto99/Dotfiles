function ll --wraps=ls --wraps='eza -lAh --icons=always' --wraps='eza -lAh --icons=always --group-directories-first' --description 'alias ll=eza -lAh --icons=always --group-directories-first'
    eza -lAh --icons=always --group-directories-first $argv

end
