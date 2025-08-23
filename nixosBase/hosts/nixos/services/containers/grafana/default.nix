{ lib, config, pkgs, ... }:
let
  cfg = config.host.containers.grafana;
in {
  options.host.containers.grafana = {
    enable       = lib.mkEnableOption "Grafana container";
    hostAddress  = lib.mkOption { type = lib.types.str; default = "10.233.7.1"; };
    localAddress = lib.mkOption { type = lib.types.str; default = "10.233.7.2"; };
    port         = lib.mkOption { type = lib.types.int; default = 2342; };
    dataDir      = lib.mkOption { type = lib.types.path; default = "/srv/grafana"; };
  };

  config = lib.mkIf cfg.enable {
    containers.grafana = {
      autoStart = true;
      privateNetwork = true;
      hostAddress  = cfg.hostAddress;
      localAddress = cfg.localAddress;

      # forward host :port -> container :port (no nginx needed)
      forwardPorts = [
        { protocol = "tcp"; hostPort = cfg.port; containerPort = cfg.port; }
      ];

      # persist data on the host
      bindMounts."/var/lib/grafana" = {
        hostPath = cfg.dataDir;
        isReadOnly = false;
      };

      config = { pkgs, ... }: {
        networking.hostName = "grafana";
        services.grafana.settings.server = {
          enable = true;
          domain = "grafana.pele";
          port   = cfg.port;
          addr   = "127.0.0.1"; # only loopback inside the container
        };
        system.stateVersion = "25.11";
      };
    };
  };
}


