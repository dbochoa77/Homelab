{ config, pkgs, ... }:

{
  networking.networkmanager.enable = true;
  networking.firewall.allowedTCPPorts = [ 80  22 8083 8080 2342 ];

  #services.resolved.enable = false;
  
  #    networking = {
  #    defaultGateway = {
  #      address = "192.168.122.1";
  #      interface = "enp1s0";
  #  };

  #  nameservers = [ "192.168.122.65" "1.1.1.1" ];
  #  domain = "demo.whydoesnothing.work";
  #  search = [ "demo.whydoesnothing.work" ];
  #  interfaces = {
  #      enp1s0.ipv4.addresses = [{
  #      address = "122.168.122.65";
  #      prefixLength = 28;
  #      }];
  #  };

  #  # vlans = { 
  #  #     vlan2 = {
  #  #       id = 2;
  #  #         interface = "enp1s0";
  #  #     };
  #  #     vlan3 = {
  #  #       id = 3; 
  #  #       interface = "enp1s0";
  #  #   };
  #  # };
  #};
  #wg-quick.inerface = {
  #  wg0 = {
  #    address = [ "10.2.0.2/32"];
  #    dns = [ "10.2.0.1"];
  #    privateKeyFile = "/etc/wireguard/private.key";
  #    peers [{
  #      publicKey = ""
  #      allowedIPS = [ "0.0.0.0/0" ];
  #      endpoint = ""
  #}];
  #};
  #};
}


