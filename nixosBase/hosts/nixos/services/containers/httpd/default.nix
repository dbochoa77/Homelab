{
  containers.httpd = { 
    autoStart = true;
    ephemeral = true;
    #    privateNetwork = true;
    #    hostAddress = "192.168.122.1";
    #    localAddress = "192.168.122.130";
    config = {...}: {
     system.stateVersion = "25.11";
     services.httpd = {
      enable = true;
      adminAddr = "foo@example.org";
     };
    };   
    bindMounts = {
        "/root/data" = {
          hostPath = "/home/admin/data";
          isReadOnly = false;
         };
       };
     };
}
