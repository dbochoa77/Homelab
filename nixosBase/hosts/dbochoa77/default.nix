{ lib, pkgs, inputs, outputs, ... }: 

{
  imports = [
	./extraServices
	./users 
	inputs.home-manager.nixosModules.home-manager
  ];
  home-manager = { 
    useUserPackages = true;
    extraSpecialArgs = {inherit inputs outputs; };
  };

  nixpkgs = {
 
    overlays = [

      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.stable-packages

    ];

  # Allows Closed Sourced packages
    config = {
      allowUnfree = true;
    };
  };

  # Experimental Features Nix-command and Flakes
  nix = { 
    settings = {
      experimental-features = ["nix-command" "flakes"];
      trusted-users = [
        "root"
	"dbochoa77"
      ];
    };

    # Automaticlly Cleans Nixos Generations 30d older
    gc = {
      automatic = true; 
      options = "--delete-older-than 30d";
    };
   
    optimise.automatic = true;
 
    registry = 
      (lib.mapAttrs (_: flake: {inherit flake;}))
      ((lib.filterAttrs (_: lib.isType "flake")) inputs);
  };
}

