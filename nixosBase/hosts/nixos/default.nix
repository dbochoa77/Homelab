{ config, inputs, outputs, lib, pkgs, ... }:

{
 imports = [
   ./hardware-configuration.nix
   ./services
   ../admin
   ./configuration.nix 
   ./serverServices.nix
   ./nodes/default.nix
   inputs.home-manager.nixosModules.home-manager
   ./modes/pieAlpha
  ];

  home-manager = {
   useUserPackages = true;
   extraSpecialArgs = { inherit inputs outputs; };
   users.admin = 
   import ../../home/nixos/default.nix;  
   }; 
}
