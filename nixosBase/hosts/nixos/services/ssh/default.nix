{ config, pkgs, ... }:

{  
  services.openssh = {
     enable = true;
     settings.PermitRootLogin = "no";
     allowSFTP = true;
   };

    services.openssh.extraConfig = ''
    X11Forwarding yes
    X11DisplayOffset 10
    X11UseLocalhost yes
  '';

  services.openssh.settings.X11Forwarding = true;
  
  environment.systemPackages = with pkgs; [
    xorg.xauth
  ];
}
