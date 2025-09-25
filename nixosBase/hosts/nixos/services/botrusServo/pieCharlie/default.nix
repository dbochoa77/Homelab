{ lib, config, pkgs, ... }:

let
  cfg = config.pieCharlie;
in {
  imports = [
    #  ./loki
    #  ./prometheus
    #  ./uptime
    ./grafana
    ./homer
  ];

  options.pieCharlie.enable = lib.mkEnableOption "pieCharlie Node";
    config = lib.mkIf cfg.enable {
      # pieCharlie.loki.enable = true;
      # pieCharlie.prometheus.enable = true;
      # pieCharlie.uptime.enable = true;
      pieCharlie.grafana.enable = true;
      pieCharlie.homer.enable = true;
    };
}


