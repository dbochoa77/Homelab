{ lib, config, pkgs, ... }:

let
  cfg = config.pieCharlie;
in {
  options.pieCharlie.uptime.enable =
    lib.mkEnableOption "uptime";

  config = lib.mkIf cfg.enable {






}
