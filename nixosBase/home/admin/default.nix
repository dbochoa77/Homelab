{ config, lib, outputs, pkgs, ... }: 

{
  import = [
    ./config/default.nix
    ./nix/default.ni.x
    ./overlays/default.nix
  ];
}
