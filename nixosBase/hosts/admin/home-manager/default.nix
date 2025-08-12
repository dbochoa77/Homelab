{ config, pkgs, outputs, ... }: 

{
  home-manager = {
    useUserPackages = true;
    extraSpecialArgs = {inherit inputs outputs; };
  };
}
