#!/usr/bin/env bash

set -e

# Variables
XINITRC="$HOME/.xinitrc"

echo "[*] Changing Repo Name to Nixos"
mv /home/dbochoa77/nixosConfiguration /home/dbochoa77/nixos

echo "[*] Moving hardware configuration"
sudo mv /etc/nixos/hardware-configuration.nix /home/dbochoa77/nixos/hosts/nixos/

echo "[*] Removing Nixos Legacy Location"
sudo rm -fr /etc/nixos

echo "[*] Updating Nixos Flake Channel..."
nix flake update 

echo "[*] Rebuilding NixOS system..."
sudo nixos-rebuild switch --flake .#nixos

echo "[*] Updating Home Manager configuration..."
home-manager switch --flake .#nixos

echo "[*] Creating .xinitrc..."
cat > "$XINITRC" <<EOF
#!/bin/sh

# Launch DWM
exec ~/.config/dwm/dwm

# Compositor
picom --config ~/.config/picom.conf &

# Set wallpaper 
feh --no-fehbg --bg-scale /home/dbochoa77/personal/Wallpapers/hannibalCrossingTheAlps.jpg &

EOF

chmod +x "$XINITRC"

echo "[*] .xinitrc created successfully."
echo "[*] Done! You can start your DWM session with 'startx'."

