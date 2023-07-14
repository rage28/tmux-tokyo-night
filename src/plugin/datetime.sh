#!/usr/bin/env bash
#
# shellcheck disable=SC2005
plugin_datetime_enabled=$(get_tmux_option "@theme_plugin_datetime_enabled" "true")
plugin_datetime_icon=$(get_tmux_option "@theme_plugin_datetime_icon" "")
plugin_datetime_accent_color=$(get_tmux_option "@theme_plugin_datetime_accent_color" "blue7")
plugin_datetime_accent_color_icon=$(get_tmux_option "@theme_plugin_datetime_accent_color_icon" "blue0")

# https://man7.org/linux/man-pages/man1/date.1.html
plugin_datetime_format=$(get_tmux_option "@theme_plugin_datetime_format" "%c")

function load_plugin() {
	if [[ "$plugin_datetime_enabled" == "true" ]]; then
		echo "${plugin_datetime_format}"
	fi
}

export plugin_datetime_enabled plugin_datetime_icon plugin_datetime_accent_color plugin_datetime_accent_color_icon
