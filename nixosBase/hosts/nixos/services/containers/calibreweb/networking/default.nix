{ lib, config, pkgs, ... }:
let
  cfg = config.host.containers.calibreweb;
in {
  options.host.containers.calibreweb.enable =
    lib.mkEnableOption "Calibre-web container";

    config = lib.mkIf cfg.enable {
      networking.firewall.allowedTCPPorts = lib.mkAfter [ 8083 ];
  };
}
