{ lib, config, pkgs, ... }:

let
  cfg = config.pieAlpha;
in {
  imports = [
    ./pihole
    #./wireguard
  ];

  options.pieAlpha.enable = lib.mkEnableOption "PieAlpha Node";
    
  config = lib.mkIf cfg.enable {
    pieAlpha.pihole.enable = true;
    #pieAlpha.wireguard.enable = true;
  };
}
