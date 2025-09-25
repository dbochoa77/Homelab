{ lib, config, pkgs, ... }:

let
  cfg = config.pieCharlie;
in {
  options.pieCharlie.homer.enable =
    lib.mkEnableOption "Homer";
      config = lib.mkIf cfg.enable { 
        services.homer.enable = true;   
        port = 8082;


        environment.systemPackages = [
        pkgs.homer
        ];      

    #    services.nginx.virtualHosts."homer.local" = {
    #      locations."/" = {
    #        proxyPass = "http://127.0.0.1:8082";
    #        proxyWebsockets = true;
    #      };
    #    };
    #  };
  };
}
