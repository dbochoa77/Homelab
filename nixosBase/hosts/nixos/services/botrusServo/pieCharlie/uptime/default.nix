{ lib, config, pkgs, ... }:

let
  cfg = config.pieCharle;
in {
  options.pieCharle.uptime.enable =
    lib.mkEnableOption "uptime";

  config = lib.mkIf cfg.enable {






}
