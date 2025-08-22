#!/usr/bin/env bash

set -e

echo "[*] Temperoy intstalling git"
nix-shell -p git

echo "[*] Partioning with Disko" 
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko/latest -- --mode destroy,format,mount /home/nixos/Homelab/nixosBase/hosts/nixos/disko-config.nix

echo "[*] Make directory /mnt/Flakes/tmp"
sudo mkdir -p /mnt/Flakes/tmp

echo "[*] Installing installation"
sudo TMPDIR=/mnt/Flakes/tmp nixos-install --flake .#nixos 

echo "[*] Removing Nixos Legacy Location"
sudo rm -fr /etc/nixos

## After making root passwd
## passwd admin
## gitclone https:/github.com/dbochoa77/Homelab
