{ lib, config, pkgs, ... }:
let
  cfg = config.host.containers.grafana;
in {
  options.host.containers.grafana.enable =
    lib.mkEnableOption "Grafana container";

    config = lib.mkIf cfg.enable {
      containers.grafana = {
        services.grafana = {
          autoStart = true;
          enable = true;
          domain = "grafana.pele";
          port = 2342;
          addr = "127.0.0.1";
        };

        # nginx reverse proxy
        services.nginx.virtualHosts.${config.services.grafana.domain} = {
          locations."/" = {
              proxyPass = "http://127.0.0.1:${toString config.services.grafana.port}";
              proxyWebsockets = true;
        };
      };
    };
  };
}

