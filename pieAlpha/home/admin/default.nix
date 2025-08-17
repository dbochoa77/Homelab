{ config, lib, outputs, pkgs, ... }:

{
  imports = [
    ./config/default.nix
    ./nix/default.nix
    ./overlays/default.nix
    ./features/default.nix
  ];
}
