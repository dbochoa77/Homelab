let 
    user = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFzAm3vpF6DkqwfvQIL5wPzjXbLBVijuPwT1HXZeOIIx";
in {
    "secret1.age".publicKeys = [user];
}
