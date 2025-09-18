{ lib, config, pkgs, ... }:
let
  cfg = config.host.containers.calibreweb;
in {
    options.host.containers.calibreweb.enable =
      lib.mkEnableOption "Calibreweb container";
  
    config = lib.mkIf cfg.enable {
      services.resolved.enable = false;
      networking.firewall.allowedTCPPorts = [ 8083 ];
    #  networking.firewall.allowedUDPPorts = [53];
  
    containers.calibreweb = {
      autoStart = true;
      privateNetwork = false;
      config = { pkgs, ... }: {
        system.stateVersion = "25.05";
        services.calibre-web = {
          enable = true;
          user = "admin";
          group = "media";
            listen = {
              ip = "127.0.01";
              port = 8083;
            };
          options = {
            calibreLibrary = "/tank/media/ebook";
            enableBookUploading = true;
            enableBookConversion = true;
          };
        };
      };
    };
  };
}

