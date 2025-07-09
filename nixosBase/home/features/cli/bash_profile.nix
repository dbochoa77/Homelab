 { config, lib, pkgs, ... }:

{
  programs.bash.initExtra = ''
    fastfetch
  '';
}

