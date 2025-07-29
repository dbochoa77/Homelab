{
  config,
  lib,
  ...
}:

{
  programs.bash = {
    enable = true;
    shellAliases = {

      # Youtube Downloader
      yt = "yt-dlp";
      "yt.rock" = "yt-dlp -x --audio-format mp3 -o \"~/music/rock/%(title)s.%(ext)s\"";
      "yt.pop" = "yt-dlp -x --audio-format mp3 -o \"~/music/pop/%(title)s.%(ext)s\"";
      "yt.hipHop" = "yt-dlp -x --audio-format mp3 -o \"~/music/hipHop/%(title)s.%(ext)s\"";
      "yt.rnbSoul" = "yt-dlp -x --audio-format mp3 -o \"~/music/rnbSoul/%(title)s.%(ext)s\"";
      "yt.classical" = "yt-dlp -x --audio-format mp3 -o \"~/music/classical/%(title)s.%(ext)s\"";
      "yt.country" = "yt-dlp -x --audio-format mp3 -o \"~/music/country/%(title)s.%(ext)s\"";
      "yt.folk" = "yt-dlp -x --audio-format mp3 -o \"~/music/folk/%(title)s.%(ext)s\"";
      "yt.jazz" = "yt-dlp -x --audio-format mp3 -o \"~/music/jazz/%(title)s.%(ext)s\"";
      "yt.blues" = "yt-dlp -x --audio-format mp3 -o \"~/music/blues/%(title)s.%(ext)s\"";
      "yt.electronic" = "yt-dlp -x --audio-format mp3 -o \"~/music/electronic/%(title)s.%(ext)s\"";
      "yt.world" = "yt-dlp -x --audio-format mp3 -o \"~/music/world/%(title)s.%(ext)s\"";
      "yt.gospel" = "yt-dlp -x --audio-format mp3 -o \"~/music/gospel/%(title)s.%(ext)s\"";
      "yt.soundtrack" = "yt-dlp -x --audio-format mp3 -o \"~/music/soundtrack/%(title)s.%(ext)s\"";
      "yt.latin" = "yt-dlp -x --audio-format mp3 -o \"~/music/latin/%(title)s.%(ext)s\"";
      "yt.rap" = "yt-dlp -x --audio-format mp3 -o \"~/music/rap/%(title)s.%(ext)s\"";

      # MPV Shuffle Play
      "mpv.rock" = "mpv --shuffle ~/music/rock";
      "mpv.pop" = "mpv --shuffle ~/music/pop";
      "mpv.hipHop" = "mpv --shuffle ~/music/hipHop";
      "mpv.rnbSoul" = "mpv --shuffle ~/music/rnbSoul";
      "mpv.classical" = "mpv --shuffle ~/music/classical";
      "mpv.country" = "mpv --shuffle ~/music/country";
      "mpv.folk" = "mpv --shuffle ~/music/folk";
      "mpv.jazz" = "mpv --shuffle ~/music/jazz";
      "mpv.blues" = "mpv --shuffle ~/music/blues";
      "mpv.electronic" = "mpv --shuffle ~/music/electronic";
      "mpv.world" = "mpv --shuffle ~/music/world";
      "mpv.gospel" = "mpv --shuffle ~/music/gospel";
      "mpv.soundtrack" = "mpv --shuffle ~/music/soundtrack";
      "mpv.latin" = "mpv --shuffle ~/music/latin";
      "mpv.rap" = "mpv --shuffle ~/music/rap";
      "mpv.phonk" = "mpv --shuffle ~/music/phonk";

      # Brightness Control
      "bright.down" = "echo 2 | sudo tee /sys/class/backlight/acpi_video0/brightness";
      "bright.up" = "echo 15 | sudo tee /sys/class/backlight/acpi_video0/brightness";
      "bright.max" = "echo 18 | sudo tee /sys/class/backlight/acpi_video0/brightness";

      # PDF
      pdf = "mupdf";

      # Screenshots
      flameshot = "flameshot gui";

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
      exam = "cd /home/dbochoa77/work/military/USN/trainingAndReadiness/training/examPrep";
      github = "cd /home/dbochoa77/tech/github/workspace";
      hoyah = "cd /home/dbochoa77/work/military/USN";
      lifelong = "xrandr --output HDMI-1 --mode 1920x1080 --right-of eDP-1 --auto";

      # Git Shortcuts
      ga = "git add .";
      gc = "git commit -";
      gs = "git status";
 
      # Nix Config Rebuild
      rebuild = "nix flake update && sudo nixos-rebuild switch --flake .#nixos && home-manager switch --flake .#nixos"; 

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

