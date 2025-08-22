{ lib, config, pkgs, ... }: 
let 
  cfg = config.containers.calibreweb;
in {
  options = { containers.calibreweb.enable = 
    lib.mkEnableOption "Calibre-web container";
  };

    config = lib.mkIf cfg.enable {
      containers.calibreweb = {
        autoStart = true;
        privateNetwork = true;
        hostAddress = "10.233.5.1";
        localAddress = "10.233.5.2";

      fowardPorts = [
      { protocol = "tcp"; hostPort = 8083; containerPort = 8083 };
      ];
      
      bindMounts = { 
        "/var/lib/calibre-web/library" = { hostPath = "/tank/media/ebook"; isReadOnly = false; };
        "/var/lib/calibre-web/data"    = { hostPath = "/srv/calibre/data"; isReadOnly = false; };
      };

      config = { pkgs, ... }: {
        services.calibre-web.enable = true;
        system.stateVersion = "25.05";
      };
    };
  };
}
