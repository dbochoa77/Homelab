{ lib, config, pkgs, ... }:
let 
  cfg = config.host.containers.pihole;
in { 
  options.host.containers.pihole.enable = 
    lib.mkEnableOption "Pi-hole container"; 

    config = lib.mkIf cfg.enable {
      services.resolved.enable = false;
      networking.firewall.allowedTCPPorts = [ 53 80 ];
      networking.firewall.allowedUDPPorts = [ 53 ];
     
    containers.pihole = {
      autoStart = true;
      privateNetwork = false; 
      config = { pkgs, ... }: {
        system.stateVersion = "25.05";
        services.pihole-ftl.enable = true;
        services.pihole-web.enable = true;
        services.pihole-web.ports = [ "80"];
      };
    };
  };
}
