{ lib, config, pkgs, ... }:
let
  cfg = config.host.containers.homer;
in {
  options.host.containers.homer.enable =
    lib.mkEnableOption "Calibre-web container";

    config = lib.mkIf cfg.enable {
      containers.homer = {
        autoStart = true;
        privateNetwork = true;
        hostAddress  = "10.233.8.1";
        localAddress = "10.233.8.2";

      forwardPorts = [ { protocol = "tcp"; hostPort = 8080; containerPort = 8080; }
      ];

      bindMounts."/srv/homer/assets" = {
        hostPath = "/srv/homer/assets";
        isReadOnly = false;
      };

      config = { pkgs, ... }: {
        networking.hostName = "homer";
        services.nginx = {
          enable = true;
          virtualHosts."_" = {
            root = "/srv/homer/assets";
          };
        };

        # Install Homer package into /srv/homer/assets
        systemd.services.setup-homer = {
          description = "Populate Homer dashboard";
          serviceConfig.Type = "oneshot";
          wantedBy = [ "multi-user.target" ];
          script = ''
            mkdir -p /srv/homer/assets
            cp -r ${pkgs.homer}/share/homer/* /srv/homer/assets/
          '';
        };

        system.stateVersion = "25.05";
      };
    };
  };
}

