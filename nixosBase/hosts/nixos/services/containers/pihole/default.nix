{ lib, config, pkgs, ... }:
let 
  cfg = config.containers.pihole;
in { 
  options = { 
    containers.pihole.enable = lib.mkEnableOption "Pi-hole container";
  }; 

    config = lib.mkIf cfg.enable {
      containers.pihole = {
      autoStart = true;
      privateNetwork = false;
      
      config = { pkgs, ... }: {
        system.stateVersion = "25.05";

        services.pihole-ftl.enable = true;

        networking.firewall.allowedTCPPorts = [ 53 80 ];
        networking.firewall.allowedUDPPorts = [ 53 ];
      };
    };
  };
}
