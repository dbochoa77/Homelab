{ config, pkgs, ... }: 

{
nix = let
    flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
        in {
            settings = {
                experimental-features = ["nix-command" "flakes"];
                    trusted-users = [
                        "root"
                        "admin"
                    ];
                };
            };
}
