{ pkgs }:

{
  systemPackages = import ./systemPackages { inherit pkgs; };
  userPackages   = import ./userPackages { inherit pkgs; };
}


