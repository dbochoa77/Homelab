#!/bin/bash
set -e 

rm /home/dbochoa77/nixosServer/hosts/nixosServer/hardware-configuration.nix

cp /etc/nixos/hardware-configuration.nix /home/dbochoa77/nixosServer/hosts/nixosServer/hardware-configuration.nix

cd nixosServer && 

nix-shell -p git --run "
sudo nixos-rebuild switch --flake .#nixosServer
home-manager switch --flake .#nixosServer
"
# Add script to source files
source .bashrc
