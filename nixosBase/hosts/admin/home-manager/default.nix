{ config, pkgs, ... }: 

{
  home-manager = {
    useUserPackages = true;
    extraSpecialArgs = {inherit inputs outputs; };
  };
}
