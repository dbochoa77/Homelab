{ config, pkgs, inputs, ... }: 

{ 
  home-manager.users.dbochoa77 =
    import ../../../home/dbochoa77/default.nix;
 }
