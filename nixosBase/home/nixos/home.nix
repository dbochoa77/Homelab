{ config, lib, pkgs, ... }:

{
  home.username = lib.mkDefault "dbochoa77";
  home.homeDirectory = lib.mkDefault "/home/${config.home.username}";

  home.stateVersion = "24.05";

  home.packages = import ../../pkgs/userPackages { inherit pkgs; };

  home.file = {
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
}
