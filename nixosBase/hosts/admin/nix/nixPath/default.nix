{ config, pkgs, lib, ... }:

{
nix = let
    flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
        nixPath =
        ["/etc/nix/path"]
        ++ lib.mapAttrsToList (flakeName: _: "${flakeName}=flake:${flakeName}") flakeInputs;
    };
}
