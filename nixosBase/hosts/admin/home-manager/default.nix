{ config, pkgs, inputs, outputs, ... }: 

{
  home-manager = {
    useUserPackages = true;
    extraSpecialArgs = {inherit inputs outputs; };
  };
}
