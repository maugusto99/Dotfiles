#! /usr/bin/env fish

function __fzf_directories -d "Search Directories with fzf"
    if test $XDG_SESSION_TYPE = wayland
        set clipboard wl-copy
    else
        set clipboard "xclip -i"
    end
    set -lx FZF_DEFAULT_COMMAND "fd  --type d --strip-cwd-prefix --hidden --color never --exclude .git"
    set -l directories (fzf  --exact \
  --preview "eza -aT -L 2 --icons --color always {}" \
  --preview-label="[ Directory content ]" \
  --preview-window=,border-rounded \
  --prompt="Directories> " \
  --info=hidden \
  --bind "alt-p:change-preview-window(hidden|)" \
  --bind "ctrl-y:execute-silent(echo -n {1..} | $clipboard)+abort" \
  --color header:italic --header "Press CTRL-Y to copy path into clipboard")
    if test -n "$directories"
        echo {cd $directories} | read -l result
        commandline -- $result
    end
    commandline -f repaint
end
