{ lib, config, pkgs, ... }:

let
  cfg = config.pieDelta;
in {
  imports = [
    ./forgejo
    #./retroArch
  ];

  options.pieDelta.enable = lib.mkEnableOption "PieDelta Node";

  config = lib.mkIf cfg.enable {
    pieDelta.forgejo.enable = true;
  };
}
