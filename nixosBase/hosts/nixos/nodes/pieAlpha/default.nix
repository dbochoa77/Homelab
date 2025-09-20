{ lib, config, pkgs, ... }:

let
  cfg = config.pieAlpha;
in {
  options.pieAlpha = {
      enable = lib.mkEnableOption "PieAlpha Node";
    };

    config = lib.mkIf cfg.enable {
      host.containers.pihole.enable = true;
      #host.containers.wireguard.enable = true;
  };
}

