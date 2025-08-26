{ lib, config, pkgs, ... }:
let
  cfg = config.host.containers.forgejo;
in {
  options.host.containers.forgejo.enable =
    lib.mkEnableOption "Forgejo container";

  config = lib.mkIf cfg.enable {
    # Host firewall (HTTP 3000, SSH 2222)
    networking.firewall.allowedTCPPorts = [ 3000 2222 ];

    containers.forgejo = {
      autoStart = true;
      privateNetwork = false;  # host networking; no forwardPorts needed

      bindMounts = {
        "/var/lib/forgejo" = { hostPath = "/srv/forgejo"; isReadOnly = false; };
      };

      # ---------- inner NixOS of the container ----------
      config = { pkgs, ... }: {
        # Postgres inside the container (peer auth over UNIX socket)
        services.postgresql = {
          enable = true;
          package = pkgs.postgresql_16;
          # Create DB + role once at first start
          initialScript = pkgs.writeText "forgejo-init.sql" ''
            DO $$
            BEGIN
              IF NOT EXISTS (SELECT FROM pg_roles WHERE rolname = 'forgejo') THEN
                CREATE ROLE forgejo LOGIN;
              END IF;
              IF NOT EXISTS (SELECT FROM pg_database WHERE datname = 'forgejo') THEN
                CREATE DATABASE forgejo OWNER forgejo;
              END IF;
            END$$;
          '';
        };

        services.forgejo = {
          enable = true;
          package = pkgs.forgejo;

          # Use Postgres via UNIX socket
          database = {
            type = "postgres";
            host = "/run/postgresql";  # UNIX socket dir
            name = "forgejo";
            user = "forgejo";
            # no password needed with peer auth
          };

          # LFS + actions like you wanted
          lfs.enable = true;

          settings = {
            server = {
              DOMAIN = "localhost";
              ROOT_URL = "http://localhost:3000/";
              HTTP_PORT = 3000;
              START_SSH_SERVER = true;
              SSH_DOMAIN = "localhost";
              SSH_PORT = 2222;
            };

            service = {
              # flip to false after you create your admin user
              DISABLE_REGISTRATION = true;
            };

            actions = {
              ENABLED = true;
              DEFAULT_ACTIONS_URL = "github";
            };

            repository.ROOT = "/var/lib/forgejo/repos";
            security.INSTALL_LOCK = false;
          };
        };

        system.stateVersion = "25.05";
      };
    };
  };
}

