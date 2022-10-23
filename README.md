# Sway-WM Setup and Theme for Debian Sid

**Sway Nordic Edition**

[![Maintenance](https://img.shields.io/maintenance/yes/2022.svg)]()

## Requirements
_This install changes Debian to the SID (Dev) Branch_


### Download Debian non-free netinstall

Use the following Debian ISO as the base <https://cdimage.debian.org/cdimage/unofficial/non-free/cd-including-firmware/weekly-builds/amd64/iso-cd/>

*do NOT grab the EDU download and this includes non-free and firmware*


## To Install


    git clone https://github.com/wildan-pratama/debian-sway

    cd debian-sway

    ./install.sh
   
## This script doesn't install any display manager, so if you don't have a display manager you can login using tty and execute sway
    
    sway

## Tutorial for sway-wm settings:

 - Background handled by swaybg
 - Gtk3 theme handled by lxappearance
 - Filebrowser = Nemo
 - Default Terminal-Emulator = kitty
 - Text-Editor = geany/nano
 - Bar = Waybar
 - Sound = Pulseaudio

Main shortcuts: `~/.config/sway/config`


<kbd>MOD</kbd> key is set to the <kbd>WINKEY</kbd>/<kbd>LINKEY</kbd>

 - <kbd>MOD</kbd>+<kbd>Return</kbd> = open terminal (kitty)
 - <kbd>MOD</kbd>+<kbd>O</kbd> = open Browser (brave)
 - <kbd>MOD</kbd>+<kbd>P</kbd> = open File Manager (nemo)
 - <kbd>MOD</kbd>+<kbd>D</kbd>= app menu (rofi)
 - <kbd>MOD</kbd>+<kbd>Q</kbd> = close focused app [kill]
 - <kbd>MOD</kbd>+<kbd>PrtSc</kbd> = screenshot/bring up screenshot menu
 - <kbd>MOD</kbd>+<kbd>X</kbd> = power-menu
 - <kbd>MOD</kbd>+<kbd>R</kbd> = resize mode
 - <kbd>MOD</kbd>+<kbd>SHIFT</kbd>+<kbd>SPACE</kbd>  = float window
     - <kbd>MOD</kbd>+<kbd>HOLD DOWN</kbd> = drag floating window
 - <kbd>MOD</kbd>+<kbd>↑ ↓ → ←</kbd>  = switch focus respectively 
 - <kbd>MOD</kbd>+<kbd>SHIFT</kbd>+<kbd>MINUS</kbd> = send to scratchpad
 - <kbd>MOD</kbd>+<kbd>MINUS</kbd> = cycle through scratchpad
 
 
 

## Tiling:

Is set to default for swaywm and can be changed to:

- stacking: Only the focused window in the container is displayed. You get a list of windows at the top of the container. 
   - <kbd>MOD</kbd>+<kbd>S</kbd> = Vertical List
   - <kbd>MOD</kbd>+<kbd>W</kbd> = Horizontal List
     - navigate lists with <kbd>MOD</kbd>+<kbd>↑ ↓ → ←</kbd> 
   - <kbd>MOD</kbd>+<kbd>E</kbd> = Back to tiling
   


![sway](https://forum.endeavouros.com/uploads/default/original/3X/b/c/bc09b71d718cb09a8efd4545cc65366c5f855441.png)
![wofi](https://forum.endeavouros.com/uploads/default/original/3X/9/d/9daff7f842bd9db097e0bb9d6be5cf5b65e6baa0.jpeg)

Waybar :
![waybar](https://forum.endeavouros.com/uploads/default/original/3X/7/3/73b22b2a678c6836c3b2d15747b0ef28e064fbc2.png)

