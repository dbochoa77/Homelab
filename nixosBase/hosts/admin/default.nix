{ config, inputs, outputs, lib, pkgs, ... }:

{
  imports = [
    ./home-manager/default.nix
    ./nix/default.nix
    ./overlays/default.nix
    ./unfree/default.nix
  ]
}
