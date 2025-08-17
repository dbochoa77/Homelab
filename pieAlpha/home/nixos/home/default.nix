{ config, lib, pkgs, ... }:

{
  home = {
    username = lib.mkDefault "admin";
    homeDirectory = lib.mkDefault "/home/admin";
    stateVersion = "24.05";
 
    packages = pkgs.userPackages;
      #import ../../pkgs/userPackages { inherit pkgs; };
    
    sessionVariables = {
      EDITOR = "nvim";
    };
  }; 
}
