{ lib, config, pkgs, ... }:
let
  cfg = config.host.containers.calibreweb;
in {
  options.host.containers.calibreweb.enable =
    lib.mkEnableOption "Calibre-web container";

    config = lib.mkIf cfg.enable {

      networking.firewall.allowedTCPPorts = lib.mkAfter [ 8083 ];

      containers.calibreweb = {
        autoStart = true;
        privateNetwork = false;
      #  hostAddress = "10.233.5.1";
      #  localAddress = "10.233.5.2";
    };
  };
};
