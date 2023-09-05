function searchpkgs --wraps="apt-cache pkgnames | fzf --exact | xargs nala show" --description "alias findpkgs=apt-cache pkgnames | fzf --exact | xargs nala show"
  apt-cache pkgnames | fzf --exact | xargs nala show $argv

end
