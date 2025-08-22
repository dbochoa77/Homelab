{ config, pkgs, ... }:

{
networking.networkmanager.enable = true;
networking.firewall.allowedTCPPorts = [ 80  22 8083 ];
networking.firewall.allowedUDPPorts = [ 53 8083 ];

services.resolved.enable = false;
}

