#!/bin/bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use
#polybar-msg cmd quit

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# multiple network interfaces
export DEFAULT_NETWORK_INTERFACE=$(ip route | grep '^default' | awk '{print $5}' | head -n1)

# Launch Polybar, using default config location ~/.config/polybar/config.ini
polybar main >&1 | tee -a /tmp/polybar_main.log &
# polybar main_bottom >&1 | tee -a /tmp/polybar_main_bottom &

if [[ $(xrandr -q | grep 'DisplayPort-1 connected')  ]]; then
		polybar external1 2>&1 | tee -a /tmp/polybar_external1.log &
fi


if [[ $(xrandr -q | grep 'DisplayPort-2 connected')  ]]; then
		polybar external2 2>&1 | tee -a /tmp/polybar_external2.log &
fi


notify-send "Polybar launched..."

