#!/bin/bash

set -e

# Update and upgrade the system
sudo apt-get update && sudo apt-get upgrade -y

# Remove snap and related packages
sudo rm -rf /var/cache/snapd/
sudo apt autoremove --purge snapd gnome-software-plugin-snap -y
sudo rm -rf ~/snap
sudo apt-mark hold snapd

# Install Nala and update system using Nala
sudo apt-get install -y nala
sudo nala fetch
sudo nala upgrade -y

# Install essential packages
sudo nala install -y git zsh nodejs npm neovim ibus-unikey gnome-tweaks gnome-shell-extension-manager flatpak gnome-software-plugin-flatpak

# Add Flathub repository
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Install Dracula theme for GNOME Terminal
sudo nala install dconf-cli -y
git clone https://github.com/dracula/gnome-terminal
pushd gnome-terminal/
./install.sh
popd

# Install Monaspace font
git clone https://github.com/githubnext/monaspace.git
pushd monaspace/
bash util/install_linux.sh
popd

# Install additional fonts
pushd fonts/
sudo mv * /usr/share/fonts/truetype/
popd
sudo nala install -y ttf-mscorefonts-installer fontconfig
sudo fc-cache -f -v

# Install GNOME extensions
gnome-extensions install user-theme@gnome-shell-extensions.gcampax.github.com
gnome-extensions install dash-to-dock@micxgx.gmail.com
gnome-extensions install blur-my-shell@aunetx
gnome-extensions install clipboard-indicator@tudmotu.com
gnome-extensions install hidetopbar@mathieu.bidon.ca
gnome-extensions install Vitals@CoreCoding.com

# Install WhiteSur GTK and icon themes
git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git
pushd WhiteSur-gtk-theme/
./install.sh -l
./tweaks.sh -F
sudo flatpak override --filesystem=xdg-config/gtk-4.0
sudo ./tweaks.sh -g
popd

git clone https://github.com/vinceliuice/WhiteSur-icon-theme.git
pushd WhiteSur-icon-theme/
./install.sh -a
popd

# Install McMojave cursors
git clone https://github.com/vinceliuice/McMojave-cursors.git
pushd McMojave-cursors/
./install.sh
popd

# Install NVM (Node Version Manager)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Powerlevel10k theme for Zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

# Reboot system
echo "Reboot the system to finish the setup in 5 seconds..."
sleep 5s
sudo reboot
