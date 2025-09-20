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
    
    systemd.tmpfiles.rules = [
      #         PATH              MODE  USER  GROUP  AGE ARG
      "d /srv/media              2775  root  media  -   -"
      "d /srv/media/music        2775  root  media  -   -"
      "d /srv/media/movies       2775  root  media  -   -"
      "d /srv/media/shows        2775  root  media  -   -"
    ];

      environment.systemPackages = [
        pkgs.jellyfin
        pkgs.jellyfin-web
        pkgs.jellyfin-ffmpeg
      ];
    };
}

