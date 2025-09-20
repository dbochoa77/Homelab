{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;

    userName  = "dbochoa77";
    userEmail = "dbochoa77@proton.me";

    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = true;
      gpg.format = "ssh";
    };
  };
}
