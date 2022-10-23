#!/usr/bin/env bash

## Copyright (C) 2020-2022 Aditya Shakya <adi1090x@gmail.com>
## Everyone is permitted to copy and distribute copies of this file under GNU-GPL3
## Autostart Programs

## Kill if already running
killall -9 dunst waybar nm-applet autotiling

## Fix cursor
xsetroot -cursor_name left_ptr

## Polkit agent (debian)
if [[ ! `pidof xfce-polkit` ]]; then
	/usr/libexec/xfce-polkit &
fi

## Luanch Waybar
waybar -c ~/.config/sway/waybar/config -s ~/.config/sway/waybar/style.css &

## Lauch notification daemon
dunst -config ~/.config/sway/bin/dunstrc

## Launch Autotling
autotling &


