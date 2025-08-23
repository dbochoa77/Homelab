{ lib, config, pkgs, ... }:
let
  name = builtins.baseNameOf (toString ./.);
in {
  # make `containerName` available to the submodules
  _module.args = { containerName = calibreweb; };

  imports = [
    ./options.nix
    ./ports.nix
    ./mounts.nix
    ./inner.nix
  ];
}






#{ lib, config, pkgs, ... }: 
#let 
#  cfg = config.host.containers.calibreweb;
#in {
#  options.host.containers.calibreweb.enable = 
#    lib.mkEnableOption "Calibre-web container";
#
#    config = lib.mkIf cfg.enable {
#      
#      networking.firewall.allowedTCPPorts = lib.mkAfter [ 8083 ];
#
#      containers.calibreweb = {
#        autoStart = true;
#        privateNetwork = false;
#      #  hostAddress = "10.233.5.1";
#      #  localAddress = "10.233.5.2";
#
#      forwardPorts = [
#      { protocol = "tcp"; 
#        hostPort = 8083; 
#        containerPort = 8083; }
#      ];
#      
#      bindMounts = { 
#        "/var/lib/calibre-web/library" = { hostPath = "/tank/media/ebook"; isReadOnly = false; };
#        "/var/lib/calibre-web/data"    = { hostPath = "/srv/calibre/data"; isReadOnly = false; };
#      };
#
#      config = { pkgs, ... }: {
#        services.calibre-web.enable = true;
#        system.stateVersion = "25.05";
#      };
#    };
#  };
#}
