{ lib, config, pkgs, ... }:

let
  cfg = config.pieCharlie;
in {
  options.pieCharlie.grafana.enable =
    lib.mkEnableOption "Grafana";

  config = lib.mkIf cfg.enable {
    services.grafana = {
      enable = true;
      settings = {
        server = {
          http_addr = "127.0.0.1";
          http_port = 3001;
          enforce_domain = true;
          enable_gzip = true;
          #domain = "grafana.your.domain";

          # Alternatively, if you want to serve Grafana from a subpath:
          # domain = "your.domain";
          # root_url = "https://your.domain/grafana/";
          # serve_from_sub_path = true;
        };

        # Prevents Grafana from phoning home
        #analytics.reporting_enabled = false;
      };
    };
  };
}


