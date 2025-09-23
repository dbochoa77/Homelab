{ lib, config, pkgs, ... }:

let
  cfg = config.pieBravo;
in {
  options.pieBravo.homeAutomation.enable =
    lib.mkEnableOption "Node-RED";

  config = lib.mkIf cfg.enable {










}
