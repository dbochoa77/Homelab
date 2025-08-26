{ config, pkgs, ... }:

{
host.containers.pihole.enable = true;
host.containers.calibreweb.enable = true;
host.containers.grafana.enable = true;
host.containers.homer.enable = true;
host.containers.forgejo.enable    = true;

  #host.containers.homeAutomation.enable = true;
  #host.containers.jellyfin.enable = true;
  #host.containers.loki.enable = true;
  #host.containers.mosquitto.enable = true;
  #host.containers.node-RED.enable = true;
  #host.containers.prometheus.enable = true;
  #host.containers.retroArch.enable = true;
  #host.containers.uptime.enable = true;
  #host.containers.wireguard.enable = true;
  #host.containers.tailscale.enable = true;
}
