{ config, pkgs, ... }:

{
networking.networkmanager.enable = true;
networking.firewall.allowedTCPPorts = [ 80  22 ];
networking.firewall.allowedUDPPorts = [ 53 ];

services.resolved.enable = false;
}

