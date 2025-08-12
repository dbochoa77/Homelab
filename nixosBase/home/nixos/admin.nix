{ config, ... }: 

{ 
  imports = [ 
    ../admin/default.nix
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

