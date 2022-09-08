#!/usr/bin/env bash

## Copyright (C) 2020-2022 Aditya Shakya <adi1090x@gmail.com>
## Everyone is permitted to copy and distribute copies of this file under GNU-GPL3
## Autostart Programs

# Kill already running process
_ps=(dunst mpd xfce-polkit waybar autotiling)
for _prs in "${_ps[@]}"; do
	if [[ `pidof ${_prs}` ]]; then
		killall -9 ${_prs}
	fi
done

# Fix cursor
xsetroot -cursor_name left_ptr

# Polkit agent
/usr/libexec/xfce-polkit &


# Luanch Waybar
waybar -c ~/.config/sway/waybar/config -s ~/.config/sway/waybar/style.css &

# Lauch notification daemon
dunst -config ~/.config/sway/bin/dunstrc

# Start mpd
exec mpd &

# Set theme
gsettings set org.gnome.desktop.interface gtk-theme "Nordic"
gsettings set org.gnome.desktop.interface icon-theme "Papirus-Dark"
gsettings set $gnome-schema cursor-theme "Layan-border Cursors"
gsettings set $gnome-schema font-name "JetBrains Mono Medium 10"

# Start autotiling
autotiling

