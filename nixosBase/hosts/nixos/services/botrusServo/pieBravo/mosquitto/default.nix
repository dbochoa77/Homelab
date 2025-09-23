{ lib, config, pkgs, ... }:

let
  cfg = config.pieBravo;
in {
  options.pieBravo.mosquitto.enable =
    lib.mkEnableOption "Mosquitoo";

  config = lib.mkIf cfg.enable {










}
