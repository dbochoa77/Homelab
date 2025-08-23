   { lib, config, pkgs, ... }:
let
  cfg = config.host.containers.calibreweb;
in {
  options.host.containers.calibreweb.enable =
    lib.mkEnableOption "Calibre-web container";

    config = lib.mkIf cfg.enable {
     bindMounts = {
        "/var/lib/calibre-web/library" = { hostPath = "/tank/media/ebook"; isReadOnly = false; };
        "/var/lib/calibre-web/data"    = { hostPath = "/srv/calibre/data"; isReadOnly = false; };
    };
  }
}
