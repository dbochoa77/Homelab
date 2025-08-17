{ config, pkgs, lib, ... }:

{
  imports =
    [
      ./services/default.nix
      ./disko-config.nix
    ];

  environment.systemPackages = import ../../pkgs/systemPackages {inherit pkgs; };
}
