{ lib, config, pkgs, ... }:

let
  cfg = config.host.jellyfin;
in {
  options.host.jellyfin = {
      enable = lib.mkEnableOption "Jellyfin Service";
    };

    config = lib.mkIf cfg.enable {
      services.jellyfin = {
        enable = true;
        openFirewall = true;
        dataDir = "/var/lib/jellyfin";
        user="admin";
      };
         
    environment.systemPackages = [
        pkgs.jellyfin
        pkgs.jellyfin-web
        pkgs.jellyfin-ffmpeg
      ];
    };
}

