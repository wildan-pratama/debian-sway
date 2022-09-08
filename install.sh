#!/bin/sh

# Change Debian to SID Branch
cp /etc/apt/sources.list /etc/apt/sources.list.bak
cp sources.list /etc/apt/sources.list 

# Copy Fonts and Background
rm -rf /usr/share/{fonts,backgrounds}
cp -aR dotfiles/backgrounds /usr/share
cp -aR dotfiles/fonts /usr/share
cp -aR dotfiles/main.py /usr/bin
ln -s /usr/bin/main.py /usr/bin/autotiling
chmod +x /usr/bin/main.py /usr/bin/autotiling

# Install sudo and additional package
apt update
apt install nala -y
nala install sudo wget curl zsh apt-transport-https software-properties-common gpg lsb-release ca-certificates -y
sudo usermod -aG sudo $USER

# Add Brave repo
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list

# Add PHP Surya repo
echo "deb https://packages.sury.org/php/ bullseye main" | sudo tee /etc/apt/sources.list.d/sury-php.list
wget -qO - https://packages.sury.org/php/apt.gpg | sudo apt-key add -

# Add Visual Studio Code repo
cp -aR vscode.list /etc/apt/sources.list.d/
cp -aR microsoft.gpg /etc/apt/trusted.gpg.d/

# Upgrade 
nala upgrade -y

# Install Sway
nala install sway waybar swaylock sway-backgrounds swayidle grim wl-clipboard rofi xwayland dunst xdg-desktop-portal-wlr qtwayland5 libnm-dev network-manager-gnome sddm slurp -y
nala install nemo brave-browser code geany kitty viewnior vlc ranger file-roller nemo-fileroller lxappearance mpd mpc ncmpcpp python3-pip -y
pip3 install i3ipc

# Required packages
nala install libglib2.0-dev libxfce4ui-2-dev libpolkit-agent-1-dev make cmake meson ninja-build build-essential -y

# install Themes and icons
nala install papirus-icon-theme -y
git clone https://github.com/EliverLara/Nordic.git /usr/share/themes/Nordic

# Install Fonts emoji
nala install fonts-noto-color-emoji -y
fc-cache -vf

# Purge Foot
nala purge foot -y

# Install Xfce Polkit
mkdir Git
cd Git
git clone https://github.com/ncopa/xfce-polkit.git
cd xfce-polkit
mkdir build
cd build
meson --prefix=/usr ..
ninja
ninja install



