{ config, inputs, outputs, lib, pkgs, ... }:

{
 imports = [
   ./hardware-configuration.nix
   ./services
   ../admin
   ./configuration.nix 
   ./services/botrusServo/pieAlpha/default.nix
    #./services/botrusServo/pieAlpha/default.nix
    #./services/botrusServo/pieAlpha/default.nix
    #./services/botrusServo/pieAlpha/default.nix
   ./services/botrusServo/pieEcho/default.nix

   inputs.home-manager.nixosModules.home-manager
  ];

  home-manager = {
   useUserPackages = true;
   extraSpecialArgs = { inherit inputs outputs; };
   users.admin = 
   import ../../home/nixos/default.nix;  
   }; 
}
