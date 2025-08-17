{ config, pkgs, lib, inputs, ... }:

{
nix = let
    flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
        in {
            registry = lib.mapAttrs (_: flake: {inherit flake;}) flakeInputs;
    };
}

