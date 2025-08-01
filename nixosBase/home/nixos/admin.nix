{ config, ... }: 

{ 
  imports = [ 
    ../admin
    ../features
    ./home.nix
    ./dotfiles/nvim 
  ]; 

  features = {
    cli = {
    fastfetch.enable = true;
    };
  };
}

