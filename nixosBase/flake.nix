{
  description = "Configuration for Nixos Server";

inputs = {
    # Manages Dotfiles
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Unstable Nixos 
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Stable Nixos
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";

    # Declarative Partions
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    Encryption for Secrets
    agenix.url = "github:ryantm/agenix";
    secrets = { 
      url = "path:./secrets";
      flake = false;
    };
    
    # My Nvim Configuration
    nvimDotfiles = {
    url = "git+https://github.com/dbochoa77/nvim.git";
    flake = false;
    };
  };
 
    outputs = { self, agenix, disko, nvimDotfiles, home-manager, nixpkgs, ...} @ inputs: let
      inherit (self) outputs;
      systems = [ "x86_64-linux" "aarch64-linux" ];
      forAllSystems = nixpkgs.lib.genAttrs systems;  
    in {
    overlays = import ./overlays {inherit inputs;};

    nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
	  specialArgs = {inherit inputs outputs;
	  user = "admin";
	  hostname = "nixos";
	  };

	  modules = [
	    ./hosts/nixos/default.nix
      	    inputs.disko.nixosModules.disko
	    agenix.nixosModules.default
	  ];
	};
      };

      homeConfigurations = { 
        "nixos" = home-manager.lib.homeManagerConfiguration {
	  pkgs = nixpkgs.legacyPackages."x86_64-linux";
	  extraSpecialArgs = {inherit inputs outputs;};
	  modules = [./home/nixos/admin.nix];
        };
      };
    };
}
