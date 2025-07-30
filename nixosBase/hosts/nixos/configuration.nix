{ config, pkgs, lib, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./services/default.nix
      ./disko-config.nix
    ];

  environment.systemPackages = import ../../pkgs/systemPackages {inherit pkgs; };
}
