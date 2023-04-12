### theme settings ###

# Status bar
set-option -g status on
set-option -g status-position top
set-option -g status-style none,fg=#a89984,bg=#3c3836
# Status bar left
set-option -g status-left-length 100
set-option -g status-left-style none,fg=#282828,bg=#a89984
set-option -g status-left '#[bold] #S #[nobold]﬿ #[fg=#a89984,bg=#3c3836]'
# Status bar right
set-option -g status-right-length 100
set-option -g status-right-style none
# BSD and GNU hostname commands generate different default output. Adapt it to your preference.
set-option -g status-right '#[fg=#504945,bg=#3c3836]#[fg=#a89984,bg=#504945] #(whoami)@#(hostname) 響 #[fg=#a89984,bg=#504945]#[fg=#282828,bg=#a89984] %a %d %b %Y %H:%M  '
# Window bars
set-option -g status-justify left
set-option -g window-status-style none
# Turn monitor-activity on to display activity glyph
set-option -g window-status-format '#{?window_start_flag,#[fg=#3c3836]#[bg=#504945],}#[fg=#a89984,bg=#504945] #I: #W #{?window_last_flag, ,}#{?window_activity_flag,#[fg=#d79921] ,}#{?window_end_flag,#[fg=#504945]#[bg=#3c3836],#[fg=#3c3836]}'
set-option -g window-status-current-style none
set-option -g window-status-current-format '#{?window_start_flag,#[fg=#3c3836]#[bg=#504945],}#[fg=#ebdbb2,bg=#504945] #I: #W #[fg=#689d6a] #{?window_end_flag,#[fg=#504945]#[bg=#3c3836],#[fg=#3c3836]}'
set-option -g window-status-activity-style none,fg=#a89984,bg=#504945
set-option -g window-status-separator ''
# Panes
set-option -g pane-active-border-style fg=#a89984
set-option -g pane-border-style fg=#504945
# Messages
set-option -g message-style none,fg=#a89984,bg=#504945
set-option -g message-command-style none,fg=#a89984,bg=#504945
