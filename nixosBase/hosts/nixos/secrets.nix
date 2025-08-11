{ config, inputs, ... }:

{
  age = {
    secrets = {
      secret1 = {
         file = /home/admin/Homelab/nixosBase/secrets/secret1.age;
        };
      };
    };
}
