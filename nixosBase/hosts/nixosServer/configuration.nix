{ config, pkgs, lib, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

boot.loader = {
  systemd-boot.enable = false;
  grub = {
    enable = true;
    efiSupport = true;
    devices = [ "nodev" ]; # for UEFI systems
  };
  efi.canTouchEfiVariables = true;
};


  # Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.trusted-users = [ "root" "dbochoa77" ];

  # Hostname
  networking.hostName = "nixosServer"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Los_Angeles";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.dbochoa77 = {
    isNormalUser = true;
    description = "dbochoa77";
    extraGroups = [ "media" "networkmanager" "wheel" "docker" ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [

    # ────── Security ──────
    nftables
    fail2ban
    gnupg
    openssl

    # ------ Jellyfin -------
    jellyfin
    jellyfin-web
    jellyfin-ffmpeg

    # ────── Web & Containers ──────
    nginx
    caddy
    docker
    docker-compose
    podman
    traefik

    # ────── Monitoring & Logging ──────
    prometheus
    grafana
    uptime-kuma
    glances
    logrotate

    # ────── Virtualization ──────
    qemu
    libvirt
    virt-manager
    vagrant
    spice-vdagent

    # ────── NixOS Tools ──────
    home-manager

    # ------ Developer Tools -----
    gcc
    clang
    gnumake
    pkg-config    

    ];

  # Enable the OpenSSH daemon.
   services.openssh = {
     enable = true;
     settings.PermitRootLogin = "no";
     allowSFTP = true;
   };

  # System State Version
  system.stateVersion = "25.11"; # Did you read the comment?

}
