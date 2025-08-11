{
  containers.httpd = { 
    autoStart = true;
    ephemeral = true;
    config = {...}: {
     services.httpd = {
      enable = true;
      adminAddr = "foo@example.org";
      };
    };
  };
}
