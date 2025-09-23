{ lib, config, pkgs, ... }:

let
  cfg = config.pieCharle;
in {
  options.pieCharle.prometheus.enable =
    lib.mkEnableOption "Prometheus";

  config = lib.mkIf cfg.enable {






}
