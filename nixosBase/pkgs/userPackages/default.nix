{ pkgs }:

(import ./terminal { inherit pkgs; })
++ 
(import ./utilities { inherit pkgs; })
++
(import ./homemanger {inherit pkgs; })
