{ config, inputs, outputs, lib, pkgs, ... }:

{
 imports = [
   ./hardware-configuration.nix
   ./services
   ../admin
   ./configuration.nix
   inputs.home-manager.nixosModules.home-manager
  ];

  home-manager = {
   useUserPackages = true;
   extraSpecialArgs = { inherit inputs outputs; };
   users.admin = 
   import ../../home/nixos/default.nix;  
   }; 

  imports = [ ./host/services/containers/default.nix ];

  containers.piehole.enable = true;
  containers.calibreweb.enable = true;
}
