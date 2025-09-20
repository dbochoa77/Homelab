{ config, pkgs, ... }:

{
 
  imports = [
    ./modes/pieAlpha   # directory with default.nix above
  ];

pieAlpha.enable = true;
  #pieBravo.enable = true;
  #pieCharlie.enable = true;
  #pieDelta.enable = true;
  #pieEcho.enable = true;
}
