{ lib, config, pkgs, ... }:
let
  cfg = config.host.containers.pihole;
in {
  options.host.containers.pihole.enable =
    lib.mkEnableOption Pi-hole container;

    config = lib.mkIf cfg.enable {
