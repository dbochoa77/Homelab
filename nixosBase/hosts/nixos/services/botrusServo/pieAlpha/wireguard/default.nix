{ lib, config, pkgs, ... }:

let
  cfg = config.pieAlpha;
in {
  options.pieAlpha.wireguard.enable =
    lib.mkEnableOption "Wireguard VPN";

  config = lib.mkIf cfg.enable {

  environment.systemPackages = [ pkgs.wireguard-tools ];

  };
}
