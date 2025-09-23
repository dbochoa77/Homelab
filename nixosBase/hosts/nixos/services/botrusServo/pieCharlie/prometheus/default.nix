{ lib, config, pkgs, ... }:

let
  cfg = config.pieCharlie;
in {
  options.pieCharlie.prometheus.enable =
    lib.mkEnableOption "Prometheus";

  config = lib.mkIf cfg.enable {






}
