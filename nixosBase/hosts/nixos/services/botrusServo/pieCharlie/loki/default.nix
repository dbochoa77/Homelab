{ lib, config, pkgs, ... }:

let
  cfg = config.pieCharlie;
in {
  options.pieCharlie.loki.enable =
    lib.mkEnableOption "Loki";

  config = lib.mkIf cfg.enable {
   





}
