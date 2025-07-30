{ config, lib, ... }:

{
  programs.bash = {
    enable = true;
    shellAliases = {
      # Brightness Control
      "bright.down" = "echo 2 | sudo tee /sys/class/backlight/acpi_video0/brightness";
      "bright.up" = "echo 15 | sudo tee /sys/class/backlight/acpi_video0/brightness";
      "bright.max" = "echo 18 | sudo tee /sys/class/backlight/acpi_video0/brightness";

      # Basic Commands
      c = "clear";
      h = "history";
      now = "date +%T";
      grep = "rg";
      ps = "procs";
      top = "htop";
      df = "df -h";
      du = "du -sh";
      t = "tree -L 2";

      # File Listing
      ls = "eza -a --icons --git";
      la = "exa -la --icons --git";
      lt = "eza -T --git-ignore --icons";

      # Directory Movement
      mkdir = "mkdir -p";
      ".." = "cd ..";
      "..." = "cd ../../";
      "...." = "cd ../../../..";
      ".4" = "cd ../../../../";
      ".5" = "cd ../../../../../";

      # Git Shortcuts
      ga = "git add .";
      gc = "git commit -";
      gs = "git status";
 
      # Nix Config Rebuild
      rebuild = "nix flake update && sudo nixos-rebuild switch --flake ~/Homelab/nixosBase#nixos && home-manager switch --flake ~/Homelab/nixosBase#nixos"; 

      # Neovim (root)
      v = "sudo -E nvim";
    };

    initExtra = ''
      cd() {
        builtin cd "$@" && eza -a --icons --git;
      }

      fastfetch
      ls -d -- * .*
    '';
  };
}

