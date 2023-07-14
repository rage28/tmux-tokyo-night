#!/usr/bin/env bash
set -euxo pipefail

export LC_ALL=en_US.UTF-8

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=src/utils.sh
. "$CURRENT_DIR/utils.sh"

theme_variation=$(get_tmux_option "@theme_variation" "night")
theme_enable_icons=$(get_tmux_option "@theme_variation" 1)

# shellcheck source=src/palletes/night.sh
. "$CURRENT_DIR/palletes/$theme_variation.sh"

### Load Options
border_style_active_pane=$(get_tmux_option "@theme_active_pane_border_style" "fg=${PALLETE['dark5']}")
border_style_inactive_pane=$(get_tmux_option "@theme_inactive_pane_border_style" "fg=${PALLETE[bg_highlight]}")
left_separator=$(get_tmux_option "@theme_left_separator" "")
right_separator=$(get_tmux_option "@theme_right_separator" "")

# https://man.openbsd.org/OpenBSD-current/man1/tmux.1#acs
window_with_activity_style=$(get_tmux_option "@theme_window_with_activity_style" "italics")
window_status_bell_style=$(get_tmux_option "@theme_status_bell_style" "bold")

tmux set-option -g status-left-length 100
tmux set-option -g status-right-length 100

tmux set-window-option -g window-status-activity-style "$window_with_activity_style"
tmux set-window-option -g window-status-bell-style "${window_status_bell_style}"

# message styling
tmux set-option -g message-style "bg=${PALLETE[red]},fg=${PALLETE[bg_dark]}"

# status bar
tmux set-option -g status-style "bg=${PALLETE[bg_highlight]},fg=${PALLETE[white]}"

# border color
tmux set-option -g pane-active-border-style "$border_style_active_pane"
tmux set-option -g pane-border-style "$border_style_inactive_pane"

### Left side
tmux set-option -g status-left "$(generate_left_side_string)"

### Windows list
tmux set-window-option -g window-status-format "$(generate_inactive_window_string)"
tmux set-window-option -g window-status-current-format "$(generate_active_window_string)"

### Right side
tmux set-option -g status-right ""
tmux set-window-option -g window-status-separator ''
