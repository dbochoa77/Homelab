{ config, ... }: 

{ 
  imports = [ 
    ../admin
    ./home.nix
    ./dotfiles/nvim 
  ]; 

  features = {
    cli = {
    fastfetch.enable = true;
    };
  };
}

