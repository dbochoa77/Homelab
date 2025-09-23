{ lib, config, pkgs, ... }:

let
  cfg = config.pieBravo;
in {
  options.pieBravo.homeAutomation.enable =
    lib.mkEnableOption "Home Automation";

  config = lib.mkIf cfg.enable {










}
