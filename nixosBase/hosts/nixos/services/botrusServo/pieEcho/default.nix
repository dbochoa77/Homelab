{ lib, config, pkgs, ... }:

let
  cfg = config.pieEcho;
in {
  imports = [
    ./jellyfin
    #./retroArch
  ];

  options.pieEcho.enable = lib.mkEnableOption "PieEcho Node";

  config = lib.mkIf cfg.enable {
    pieEcho.jellyfin.enable = true;
    #pieEcho.retroArch.enable = true;
  };
}


