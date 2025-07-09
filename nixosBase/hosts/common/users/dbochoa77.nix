{ 
   config, 
   pkgs, 
   inputs,
   ...
}: { 
  users.users.dbochoa77 = {
    isNormalUser = true;
    description = "dbochoa77";
    extraGroups = [ "media" "networkmanager" "wheel" "docker" ];
 
    packages = [inputs.home-manager.packages.${pkgs.system}.default];
  };
  home-manager.users.dbochoa77 =
    import ../../../home/dbochoa77/${config.networking.hostName}.nix;
 }
