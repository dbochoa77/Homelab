{ lib, config, pkgs, ... }:

let
  cfg = config.pieBravo;
in {
  imports = [
    # ./homeAutomation
    # ./mosquitto
    # ./note-RED
  ];

  options.pieBravo.enable = lib.mkEnableOption "pieBravo Node";

  config = lib.mkIf cfg.enable {
    # pieBravo.homeAutomation.enable = true;
    # pieBravo.mosquitto.enable = true;
    # pieBravo.note-RED.enable = true;
  };
}


