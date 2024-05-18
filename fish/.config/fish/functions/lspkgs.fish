function lspkgs --wraps=dpkg-query\ -W\ --showformat=\"\ \\n\" --wraps="dpkg-query -W | column -t" --description "alias listpkgs=dpkg-query -W | column -t"
    dpkg-query -W | column -t $argv

end
