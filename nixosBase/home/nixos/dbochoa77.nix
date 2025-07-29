{ config, ... }: { 
  imports = [ 
    ../dbochoa77
    ../features/cli
    ./home.nix
    ./dotfiles
  ]; 

  features = {
    cli = {
    fastfetch.enable = true;
    };
  };
}

