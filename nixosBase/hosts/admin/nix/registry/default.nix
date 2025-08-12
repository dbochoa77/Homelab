{ config, pkgs, lib, ... }:

{
nix = let
    flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs; {
        registry = lib.mapAttrs (_: flake: {inherit flake;}) flakeInputs;
    }
}

