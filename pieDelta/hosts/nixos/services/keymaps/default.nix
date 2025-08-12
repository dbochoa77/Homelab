{ config, pkgs, ... }:

{
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
}
