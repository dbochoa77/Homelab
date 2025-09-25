{ lib, config, pkgs, ... }:

let
  cfg = config.pieDelta;
in {
  options.pieDelta.nextcloud.enable =
    lib.mkEnableOption "Nextcloud Service"; config = lib.mkIf cfg.enable {
      environment.etc."nextcloud-admin-pass".text = "PasswordPassword";
      services.nextcloud = {
        enable = true;
        package = pkgs.nextcloud31;
        hostName = "localhost";
        config.adminpassFile = "/etc/nextcloud-admin-pass";
        config.dbtype = "sqlite";


        maxUploadSize = "1G";

        settings = {
          trusted_domains = [
          "localhost"
          "192.168.122.65"
        ];

        dbochoa77 = {
          passwordFile = "/etc/nc-pass-dbochoa77";
          displayName = "Diego";
          groups = [ "users" "admin" ];
         };
      };
    };
  };
}
