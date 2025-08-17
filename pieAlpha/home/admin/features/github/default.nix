{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;

    userName  = "dbochoa77";
    userEmail = "dbochoa77@proton.me";

    signing = {
      key = "~/.ssh/id_ed25519";
      signByDefault = true;
    };

    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = true;
      gpg.format = "ssh";
    };
  };
}
