{ config, inputs, outputs, lib, pkgs, ... }:

{
 imports = [
   ./hardware-configuration.nix
    #   ./secrets.nix
   ./services
   ../dbochoa77
   ../dbochoa77/extraServices
   ./configuration.nix
   inputs.home-manager.nixosModules.home-manager
  ];

  extraServices.podman.enable = true;

  #
  #  # Define a user account. Don't forget to set a password with ‘passwd’.
  #  users.users.dbochoa77 = {
  #    isNormalUser = true;
  #    description = "dbochoa77";
  #    extraGroups = [ "media" "networkmanager" "wheel" "docker" ];
  #  };

  home-manager = {
   useUserPackages = true;
   extraSpecialArgs = { inherit inputs outputs; };
   users.dbochoa77 = 
   import ../../home/nixos/dbochoa77.nix; 
  
   }; 
}
