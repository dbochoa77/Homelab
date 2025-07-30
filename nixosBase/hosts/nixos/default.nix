{ config, inputs, outputs, lib, pkgs, ... }:

{
 imports = [
   ./hardware-configuration.nix
    #   ./secrets.nix
   ./services
   ../admin
   ../admin/extraServices
   ./configuration.nix
   inputs.home-manager.nixosModules.home-manager
  ];

  extraServices.podman.enable = true;

  home-manager = {
   useUserPackages = true;
   extraSpecialArgs = { inherit inputs outputs; };
   users.admin = 
   import ../../home/nixos/admin.nix; 
  
   }; 
}
