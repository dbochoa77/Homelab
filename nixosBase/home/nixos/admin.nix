{ config, ... }: 

{ 
  imports = [ 
    ../admin
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

