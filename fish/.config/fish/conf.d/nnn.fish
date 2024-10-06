### NNN
if command -v nnn
    set -gx NNN_OPENER nvim
    set -gx NNN_PLUG 'f:fd-finder;g:grep-finder;p:preview-tui;d:diffs;c:fzcd;z:autojump;x:perm-delete;e:suedit'
    set -gx NNN_OPTS aAdeiuUQxH
    set -gx NNN_FCOLORS 030304020000060801030500 # filetype colors. this mimics dircolors
    set -gx LESSUTFCHARDEF "E000-F8FF:p,F0000-FFFFD:p,100000-10FFFD:p"
    set -gx NNN_TRASH 2
end
