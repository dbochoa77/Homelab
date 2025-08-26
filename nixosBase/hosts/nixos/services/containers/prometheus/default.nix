{ lib, config, pkgs, ... }:
let
  cfg = config.host.containers.prometheus;
in {
  options.host.containers.prometheus.enable =
    lib.mkEnableOption "Prometheus container";

    config = lib.mkIf cfg.enable {
    
      services.prometheus.enable = true;
    }
}
