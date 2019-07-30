set -sg escape-time 0
set-option -g status-position top
set-option -g renumber-windows on

set -g prefix C-a
unbind C-b
bind C-a send-prefix

unbind %
bind | split-window -h
bind - split-window -v

unbind M-l
unbind M-h
bind-key -n M-l next-window
bind-key -n M-h previous-window
bind-key -n M-L swap-window -t +1
bind-key -n M-H swap-window -t -1
bind-key -n M-1 select-window -t 1
bind-key -n M-2 select-window -t 2
bind-key -n M-3 select-window -t 3
bind-key -n M-4 select-window -t 4
bind-key -n M-5 select-window -t 5
bind-key -n M-6 select-window -t 6
bind-key -n M-7 select-window -t 7
bind-key -n M-8 select-window -t 8
bind-key -n M-9 select-window -t 9
bind-key -n M-0 select-window -t 0

unbind M-t
bind-key -n M-t new-window
