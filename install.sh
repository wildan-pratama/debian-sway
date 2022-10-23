#!/bin/sh

# Change Debian to SID Branch
sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak
sudo cp sources.list /etc/apt/sources.list

# Copy Fonts and Background
sudo cp -aR dotfiles/fonts /usr/share
sudo cp -aR dotfiles/extra /usr/share
sudo cp -aR main.py /usr/bin
sudo ln -s /usr/bin/main.py /usr/bin/autotiling
sudo chmod +x /usr/bin/main.py /usr/bin/autotiling

# Install nala and additional package
sudo apt update
sudo apt install nala -y
sudo nala install sudo wget git curl zsh apt-transport-https software-properties-common gpg lsb-release ca-certificates -y

# Add Brave repo
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list

# Add PHP Surya repo
echo "deb https://packages.sury.org/php/ bullseye main" | sudo tee /etc/apt/sources.list.d/sury-php.list
wget -qO - https://packages.sury.org/php/apt.gpg | sudo apt-key add -

# Add Visual Studio Code repo
sudo cp -aR vscode.list /etc/apt/sources.list.d/
sudo cp -aR microsoft.gpg /etc/apt/trusted.gpg.d/

# Upgrade 
sudo nala upgrade -y

# Install Sway
sudo nala install sway pavucontrol waybar swaylock sway-backgrounds swayidle grim wl-clipboard rofi xwayland dunst xdg-desktop-portal-wlr qtwayland5 libnm-dev network-manager-gnome slurp -y
sudo nala install nemo btop neofetch network-manager-openvpn-gnome geany kitty viewnior vlc ranger file-roller nemo-fileroller lxappearance mpd mpc ncmpcpp python3-pip -y
pip3 install i3ipc

# Install Package for web dev
nala install code composer nginx network-manager libnss3-tools jq xsel php8.1-cli php8.1-curl php8.1-mbstring php8.1-mcrypt php8.1-xml php8.1-zip php8.1-sqlite3 php8.1-mysql php8.1-pgsql php8.1-fpm -y

# Install xfce-polkit
sudo nala install libglib2.0-dev libxfce4ui-2-dev libpolkit-agent-1-dev make cmake meson ninja-build build-essential -y
mkdir Git
cd Git
git clone https://github.com/ncopa/xfce-polkit.git
cd xfce-polkit
mkdir build
cd build
meson --prefix=/usr ..
ninja
sudo ninja install
cd ..
cd ..
cd ..

# Install Theme, Icon and Font
sudo nala install papirus-icon-theme fonts-noto-color-emoji -y
sudo git clone https://github.com/EliverLara/Nordic.git /usr/share/themes/Nordic
fc-cache -vf

# Revome unused package
sudo nala purge foot zutty -y

# Copy config file
mkdir -p ~/.config
mkdir -p ~/Pictures
cp -aR dotfiles/config/* ~/.config
cp dotfiles/config/.gtkrc-2.0 ~/
cp -aR dotfiles/backgrounds ~/Pictures
touch ~/.config/mpd/database

# Finish
systemctl enable --user mpd
sudo nala upgrade -y && sudo nala install jq
