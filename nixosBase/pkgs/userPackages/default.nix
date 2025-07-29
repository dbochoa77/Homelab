{ pkgs }:

(import ./3DPrinting { inherit pkgs; })
++ 
(import ./terminal { inherit pkgs; })
++ 
(import ./utilities { inherit pkgs; })

