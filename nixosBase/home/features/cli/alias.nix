{
  config, 
  lib,
  ...
}:

{
  programs.bash = {
    enable = true;
    shellAliases = { 
      # Basic
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
  
      # Directory movement
      mkdir = "mkdir -p";
      ".." = "cd ..";
      "..." = "cd ../../";
      "...." = "cd ../../../..";
      ".4" = "cd ../../../../";
      ".5" = "cd ../../../../../";
  
      # Git
      ga = "git add .";
      gc = "git commit -";
      gs = "git status";
  
      # Nix config + rebuild
      nixConfig = "sudo -E nvim /etc/nixos/configuration.nix";
      rebuild = "sudo nixos-rebuild switch --flake ~/nixosServer#nixosServer && home-manager switch --flake ~/nixosServer#nixosServer";
  
      # Neovim (root)
      v = "sudo -E nvim";
     };
     
    initExtra = ''    
      cd() {
        builtin cd "$@" && eza -1A --color=auto;
      }
      
      fastfetch
      ls -d -- * .*
    '';

  };
}

