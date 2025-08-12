{ config, pkgs, ... }:

{
    registry = lib.mapAttrs (_: flake: {inherit flake;}) flakeInputs;
}

