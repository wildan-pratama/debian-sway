#!/bin/sh
mkdir -p ~/{Desktop,Documents,Downloads,Music,Pictures,Public,Templates,Videos}
mkdir -p ~/.config
cp -aR MPD/.{mpd,ncmpcpp} ~/
cp -aR config/{geany,gtk-3.0,kitty,ncmpcpp,sway} ~/.config
cp -aR config/.gtkrc-2.0 ~/