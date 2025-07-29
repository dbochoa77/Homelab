{ config, pkgs, lib, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./services/default.nix
    ];

  environment.systemPackages = import ../../pkgs/systemPackages {inherit pkgs; };

  # Encryption   
  services.encryption.enable = true; 

}
