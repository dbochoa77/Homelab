{ lib, config, pkgs, ... }:

let
  cfg = config.pieDelta;
in {
  options.pieDelta.forgejo.enable =
    lib.mkEnableOption "Forgejo Service"; config = lib.mkIf cfg.enable {
      environment.systemPackages = [ pkgs.forgejo ];
            
        services.forgejo = {
          enable  = true;
          package = pkgs.forgejo;
          settings = {
            server = {
              DOMAIN    = "192.168.122.65";       
              ROOT_URL  = "http://192.168.122.65:3000/";
              HTTP_ADDR = "0.0.0.0";
              HTTP_PORT = 3000;
              START_SSH_SERVER = true;
              SSH_PORT = 2222;
            };
            database.DB_TYPE = "sqlite3";       
            service.DISABLE_REGISTRATION = true; 
          };
        };
        networking.firewall.allowedTCPPorts = [ 3000 2222 ];
  };
}
