{ config, lib, pkgs, ... }:

{
  home = {
    username = lib.mkDefault "admin";
    homeDirectory = lib.mkDefault "/home/${config.home.username}";
    stateVersion = "24.05";
   
    packages = import ../../pkgs/userPackages { inherit pkgs; };
    
    sessionVariables = {
      EDITOR = "nvim";
    };
  }; 
   
  programs.home-manager.enable = true;
}
