{ inputs, ... }: {
  # This one brings our custom packages from the 'pkgs' directory
  additions = final: _prev: import ../pkgs { pkgs = final; };

  # This one contains whatever you want to overlay
  # You can change versions, add patches, set compilation flags, anything really.
  # https://nixos.wiki/wiki/Overlays
  modifications = final: prev:
    {
      # Patch vagrant to ignore broken symlink check
      vagrant = prev.vagrant.overrideAttrs (old: {
      dontFixup = true;
      });
    };

  stable-packages = final: _prev: {
    pkgsStable = import inputs.nixpkgs-stable {
      system = final.system;
      config.allowUnfree = true;
    };
  };
}

