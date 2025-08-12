{ config, inputs, outputs, lib, pkgs, ... }:

{
 imports = [
   ./hardware-configuration.nix
   ./services
   ../admin
   ./configuration.nix
   inputs.home-manager.nixosModules.home-manager
   inputs.disko.nixosModules.disko
  ];

  home-manager = {
   useUserPackages = true;
   extraSpecialArgs = { inherit inputs outputs; };
   users.admin = 
   import ../../home/nixos/default.nix;  
   }; 
}
