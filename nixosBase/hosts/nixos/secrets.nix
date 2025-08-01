{ config, inputs, ... }:

{
  age = {
    secrets = {
      secret1 = {
         file = "${inputs.secrets}/secret1.age";
        };
      };
    };
}
