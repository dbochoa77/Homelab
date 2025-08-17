{
  containers.pihole = {
    autoStart = true;
    privateNetwork = true;

    # veth pair host<->container
    hostAddress  = "10.233.1.1";
    localAddress = "10.233.1.2";

    forwardPorts = [
      # DNS
      { protocol = "udp"; hostPort = 53; containerPort = 53; }
      { protocol = "tcp"; hostPort = 53; containerPort = 53; }

      # Web UI
      { protocol = "tcp"; hostPort = 80; containerPort = 80; }
    ];

    config = { pkgs, ... }: {
      system.stateVersion = "25.11";
      services.pihole-ftl.enable = true;
      #      services.pihole-ftl.webPassword = "passwd";
      networking.firewall.allowedTCPPorts = [ 53 80 ];
      networking.firewall.allowedUDPPorts = [ 53 ];
    };
  };
}
