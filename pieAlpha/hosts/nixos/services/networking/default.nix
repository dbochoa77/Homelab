{ config, pkgs, ... }:

{
networking.networkmanager.enable = true;
networking.firewall.allowedTCPPorts = [ 80  22 ];
}

