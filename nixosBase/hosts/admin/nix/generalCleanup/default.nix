{ config, pkgs, inputs, lib, ... }:

{ 
    nix = let
        flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
            in {
                gc = {
                automatic = true;
                options = "--delete-older-than 30d";
            };
    };
}
