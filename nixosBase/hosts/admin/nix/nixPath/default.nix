{ config, pkgs, lib, inputs, ... }:

{
nix = let
    flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
        in {
            nixPath =
            ["/etc/nix/path"]
            ++ lib.mapAttrsToList (flakeName: _: "${flakeName}=flake:${flakeName}") flakeInputs;
         };
}
