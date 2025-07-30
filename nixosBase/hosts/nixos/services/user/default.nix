{ config, pkgs, ... }:

{
  users.users.admin = {
    isNormalUser = true;
    description = "admin";
    extraGroups = [ "media" "networkmanager" "wheel" "docker" ];
  };
}
