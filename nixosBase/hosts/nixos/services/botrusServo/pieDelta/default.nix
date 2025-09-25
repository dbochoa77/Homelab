{ lib, config, pkgs, ... }:

let
  cfg = config.pieDelta;
in {
  imports = [
    ./forgejo
    ./calibreweb
    ./nextcloud

  ];

  options.pieDelta.enable = lib.mkEnableOption "PieDelta Node";

  config = lib.mkIf cfg.enable {
    pieDelta.forgejo.enable = true;
  # pieDelta.nextcloud.enable = true;
  # pieDelta.calibreweb.enable = true;
  };
}
