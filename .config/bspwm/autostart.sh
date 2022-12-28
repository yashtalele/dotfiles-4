#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

# Kill if already running
killall -9 xsettingsd sxhkd dunst ksuperkey xfce4-power-manager bspc

#Set bg
xwallpaper --output DisplayPort-2 --zoom "$HOME/.config/sxiv/external.png" --output DisplayPort-1 --zoom "$HOME/.config/sxiv/external.png" --output eDP --zoom "$HOME/.config/sxiv/main.png" &

# xwallpaper --output eDP --zoom "$HOME/.config/sxiv/main.png" & 

#Launch polybar
ps -ef | grep polybar | grep -v grep | awk '{print $2}' | xargs kill
run $HOME/.config/polybar/launch.sh 

#Launch keybinding deamon
sxhkd -c ~/.config/bspwm/sxhkdrc &

#Put cursor on screen
run xsetroot -cursor_name left_ptr 

#Desktop effect
ps -ef | grep picom | grep -v grep | awk '{print $2}' | kill
run picom --experimental-backend --config $HOME/.config/bspwm/picom.conf 

#Polkit
if [[ ! `pidof xfce-polkit` ]]; then
        /usr/lib/xfce-polkit/xfce-polkit &
fi

#Enable power management
xfce4-power-manager & 

#Notification
launch_dunst &

# Start mpd
exec mpd &

sleep 1
# wake up
caffeine &

xidlehook --not-when-audio --not-when-fullscreen --timer 1800 'betterlockscreen -l' '' &
#Put monitor at the right workspace 
#$HOME/.bin/bspcwm &
