{ config, pkgs, ... }:

{
host.containers.pihole.enable = true;
host.containers.calibreweb.enable = true;
host.containers.grafana.enable = true;
host.containers.homer.enable = true;
}
