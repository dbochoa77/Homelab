let 
    nixos = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMAx+jc82f2W7Sebla9PN/LYvXumikklbGptt48es+A5";
in {
    "secret1.age".publicKeys = [nixos];
}
