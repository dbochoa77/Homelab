{ pkgs }: 
( import ./developerTools { inherit pkgs; })
++
( import ./nixos-tools { inherit pkgs; })
++
( import ./security { inherit pkgs; })
++
( import ./utilities{ inherit pkgs; })
++
( import ./services{ inherit pkgs; })
