{ config, pkgs, inputs, ... }: 

{ 
  home-manager.users.admin =
    import ../../../home/admin/default.nix;
 }
