{
  config,
  lib,
  outputs,
  pkgs,
  ...
}: {
 
  #  home.stateVersion = "24.05";
  #  home.username = "dbochoa77";
  #  home.homeDirectory = "/home/dbochoa77";


    nixpkgs = {
    # Overlays
    overlays = [
    outputs.overlays.additions
    outputs.overlays.modifications
    outputs.overlays.stable-packages

    ];

    config = {
    allowUnfree = true;

    allowUnfreePredicate = _: true;
  };
};

  nix = {
    package = lib.mkDefault pkgs.nix;
    settings = {
      experimental-features = ["nix-command" "flakes"];
      warn-dirty = false;
    };
  };
}
