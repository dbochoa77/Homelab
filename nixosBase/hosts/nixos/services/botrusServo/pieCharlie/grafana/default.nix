{ lib, config, pkgs, ... }:

let
  cfg = config.pieCharle;
in {
  options.pieCharle.loki.enable =
    lib.mkEnableOption "Grafana";

  config = lib.mkIf cfg.enable {






}
