{ config, ... }: 

{ 
  imports = [ 
    ../admin
    ./features/default.nix
    ./home/default.nix
    ./nvim/default.nix 
  ]; 
}

