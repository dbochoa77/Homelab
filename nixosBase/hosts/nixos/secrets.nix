{ config, inputs, ... }:

{
age.identityPaths = [
    "/home/admin/.ssh/id_ed25519"
  ];
  
age = {
    secrets = {
      secret1 = {
         file = ../../secrets/secret1.age;
        };
      };
    };
}
