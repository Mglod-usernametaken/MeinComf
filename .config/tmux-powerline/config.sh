# General {
# Show which segment fails and its exit code.
export TMUX_POWERLINE_DEBUG_MODE_ENABLED="false"
# Use patched font symbols.
export TMUX_POWERLINE_PATCHED_FONT_IN_USE="true"

# The theme to use.
export TMUX_POWERLINE_THEME="default"
# Overlay directory to look for themes. There you can put your own themes outside the repo. Fallback will still be the "themes" directory in the repo.
export TMUX_POWERLINE_DIR_USER_THEMES="${XDG_CONFIG_HOME:-$HOME/.config}/tmux-powerline/themes"
# Overlay directory to look for segments. There you can put your own segments outside the repo. Fallback will still be the "segments" directory in the repo.
export TMUX_POWERLINE_DIR_USER_SEGMENTS="${XDG_CONFIG_HOME:-$HOME/.config}/tmux-powerline/segments"

# The initial visibility of the status bar. Can be {"on", "off", "2"}. 2 will create two status lines: one for the window list and one with status bar segments.
export TMUX_POWERLINE_STATUS_VISIBILITY="2"
# In case of visibility = 2, where to display window status and where left/right status bars.
# 0: window status top, left/right status bottom; 1: window status bottom, left/right status top
export TMUX_POWERLINE_WINDOW_STATUS_LINE=1
# The status bar refresh interval in seconds.
# Note that events that force-refresh the status bar (such as window renaming) will ignore this.
export TMUX_POWERLINE_STATUS_INTERVAL="1"
# The location of the window list. Can be {"absolute-centre, centre, left, right"}.
# Note that "absolute-centre" is only supported on `tmux -V` >= 3.2.
export TMUX_POWERLINE_STATUS_JUSTIFICATION="absolute-centre"

# The maximum length of the left status bar.
export TMUX_POWERLINE_STATUS_LEFT_LENGTH="60"
# The maximum length of the right status bar.
export TMUX_POWERLINE_STATUS_RIGHT_LENGTH="90"

# The separator to use between windows on the status bar.
export TMUX_POWERLINE_WINDOW_STATUS_SEPARATOR=""

# Uncomment these if you want to enable tmux bindings for muting (hiding) one of the status bars.
# E.g. this example binding would mute the left status bar when pressing <prefix> followed by Ctrl-[
#export TMUX_POWERLINE_MUTE_LEFT_KEYBINDING="C-["
#export TMUX_POWERLINE_MUTE_RIGHT_KEYBINDING="C-]"
# }

# kubernetes_context.sh {
# Kubernetes config context display mode {"name_namespace", "name", "namespace"}.
# export TMUX_POWERLINE_SEG_KUBERNETES_CONTEXT_DISPLAY_MODE="name_namespace"
# Kubernetes config context symbol.
# export TMUX_POWERLINE_SEG_KUBERNETES_CONTEXT_SYMBOL="󱃾"
# Kubernetes config context symbol colour.
# export TMUX_POWERLINE_SEG_KUBERNETES_CONTEXT_SYMBOL_COLOUR="255"
# Separator for display mode "name_namespace"
# TMUX_POWERLINE_SEG_KUBERNETES_CONTEXT_SEPARATOR="󰿟"
# }

# lan_ip.sh {
# Symbol for LAN IP.
# export TMUX_POWERLINE_SEG_LAN_IP_SYMBOL="ⓛ "
# Symbol colour for LAN IP
# export TMUX_POWERLINE_SEG_LAN_IP_SYMBOL_COLOUR="255"
# }

# mode_indicator.sh {
# Whether the normal & prefix mode section should be enabled. Should be {"true, "false"}.
export TMUX_POWERLINE_SEG_MODE_INDICATOR_NORMAL_AND_PREFIX_MODE_ENABLED="true"
# Normal mode text & color overrides. Defaults to "normal" & the segment foreground color set in the theme used.
export TMUX_POWERLINE_SEG_MODE_INDICATOR_NORMAL_MODE_TEXT="normal"
export TMUX_POWERLINE_SEG_MODE_INDICATOR_NORMAL_MODE_TEXT_COLOR=""
# Prefix mode text & color overrides. Defaults to "prefix" & the segment foreground color set in the theme used.
export TMUX_POWERLINE_SEG_MODE_INDICATOR_PREFIX_MODE_TEXT="prefix"
export TMUX_POWERLINE_SEG_MODE_INDICATOR_PREFIX_MODE_TEXT_COLOR=""
# Whether the mouse mode section should be enabled. Should be {"true, "false"}.
export TMUX_POWERLINE_SEG_MODE_INDICATOR_MOUSE_MODE_ENABLED="true"
# Mouse mode text & color overrides. Defaults to "mouse" & the segment foreground color set in the theme used.
export TMUX_POWERLINE_SEG_MODE_INDICATOR_MOUSE_MODE_TEXT="mouse"
export TMUX_POWERLINE_SEG_MODE_INDICATOR_MOUSE_MODE_TEXT_COLOR=""
# Whether the copy mode section should be enabled. Should be {"true, "false"}.
export TMUX_POWERLINE_SEG_MODE_INDICATOR_COPY_MODE_ENABLED="true"
# Copy mode text & color overrides. Defaults to "copy" & the segment foreground color set in the theme used.
export TMUX_POWERLINE_SEG_MODE_INDICATOR_COPY_MODE_TEXT="copy"
export TMUX_POWERLINE_SEG_MODE_INDICATOR_COPY_MODE_TEXT_COLOR=""
# Suspend mode text & color overrides. Defaults to "SUSPEND" & the segment foreground color set in the theme used.
export TMUX_POWERLINE_SEG_MODE_INDICATOR_SUSPEND_MODE_TEXT="SUSPEND"
export TMUX_POWERLINE_SEG_MODE_INDICATOR_SUSPEND_MODE_TEXT_COLOR=""
# Separator text override. Defaults to " • ".
export TMUX_POWERLINE_SEG_MODE_INDICATOR_SEPARATOR_TEXT=" • "
# }
# vpn.sh {
# Mode for VPN segment {"both", "ip", "name"}. both: Show NIC/IP; ip: Show only IP; name: Show only NIC name
# export TMUX_POWERLINE_SEG_VPN_DISPLAY_MODE="both"
# Space separated list of tunnel interface names. First match is being used. substring match, regexp can be used.
# Examples:
# export TMUX_POWERLINE_SEG_VPN_NICS="tun" # will match 'tun0', 'utun0', 'itun', 'tun08127387'
# export TMUX_POWERLINE_SEG_VPN_NICS="tun0 tuntun" # will match 'tun0', 'utun0', 'tuntun'
# export TMUX_POWERLINE_SEG_VPN_NICS="^tun0$ ^tun1$" # exactly 'tun0' and 'tun1'
# Default:
# export TMUX_POWERLINE_SEG_VPN_NICS='^u?tun[0-9]+$'
# Symbol to use for vpn tunnel.
# export TMUX_POWERLINE_SEG_VPN_SYMBOL="󱠾 "
# Colour for vpn tunnel symbol
# export TMUX_POWERLINE_SEG_VPN_SYMBOL_COLOUR="255"
# Symbol for separator
# export TMUX_POWERLINE_SEG_VPN_DISPLAY_SEPARATOR="󰿟"
# }
