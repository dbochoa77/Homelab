{ config, lib, pkgs, ... }:

{
  home.username = lib.mkDefault "admin";
  home.homeDirectory = lib.mkDefault "/home/${config.home.username}";

  home.stateVersion = "24.05";

  home.packages = import ../../pkgs/userPackages { inherit pkgs; };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
}
