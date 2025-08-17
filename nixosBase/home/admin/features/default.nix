{ config, pkgs, ... }: 

{
    imports = [
    ./alias/default.nix
    ./fastfetch/default.nix
    ./bat/default.nix
    ./eza/default.nix
    ./github/default.nix
    ];

}
