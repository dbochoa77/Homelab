{
      containers.calibreweb = {
        autoStart = true;
        privateNetwork = true;
        ephemeral = true;

      hostAddress  = "10.233.5.1";
      localAddress = "10.233.5.2";
      forwardPorts = [
        { protocol = "tcp"; hostPort = 8083; containerPort = 8083; }
      ];

      bindMounts = {
        "/var/lib/calibre-web/library" = { hostPath = "/tank/media/ebook"; isReadOnly = false; };
        "/var/lib/calibre-web/data"    = { hostPath = "/srv/calibre/data"; isReadOnly = false; };
      };

      config = { pkgs, ... }: {
        users.groups.media = { };
              
      services.calibre-web = {
        enable = true;
        group = "media";
        listen.ip = "0.0.0.0";     # important for forwarded traffic
        listen.port = 8083;
        dataDir = "/var/lib/calibre-web/data";
        options = {
          calibreLibrary       = "/var/lib/calibre-web/library";
          enableBookUploading  = true;
          enableBookConversion = true;
        };
        openFirewall = false;      # we'll open explicitly below
      };

        networking.firewall.allowedTCPPorts = [ 8083 ];
        
      systemd.tmpfiles.rules = [
        "d /srv/calibre 0750 root root -"
        "d /srv/calibre/data 2770 root media -"
      ];  
    };
  };
}
