#!/bin/bash

# Step 1: Install necessary tools
sudo pacman -Syu --needed git base-devel

# If you use an AUR helper like yay, install it first
# Clone yay repository and build it
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..

# Step 2: Clone the backup repository
cd ~
git clone https://github.com/davinrizo/arcb.git

# Step 3: Install official repository packages
sudo pacman -S --needed - <~/arch-backup/pkglist.txt

# Step 4: Install AUR packages
yay -S --needed - <~/arch-backup/pkglist_aur.txt

# Step 5: Restore configuration files
cp -r ~/arch-backup/.config ~/
cp ~/arch-backup/.bashrc ~/
cp ~/arch-backup/.zshrc ~/
cp ~/arch-backup/.profile ~/
# Add other files and directories as needed

# Optionally, clean up the yay directory
rm -rf yay
