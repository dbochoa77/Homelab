{ config, inputs, outputs, lib, pkgs, ... }:

{
 imports = [
   ./hardware-configuration.nix
   inputs.home-manager.nixosModules.home-manager
];

networking.hostName = "nixosServer";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.dbochoa77 = {
    isNormalUser = true;
    description = "dbochoa77";
    extraGroups = [ "media" "networkmanager" "wheel" "docker" ];
  };

home-manager = {
  useUserPackages = true;
  extraSpecialArgs = { inherit inputs outputs; };
  users.dbochoa77 = 
  import ../../home/nixosServer/dbochoa77.nix; 

  }; 
}
