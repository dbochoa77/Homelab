#{ inputs, ...}: 
#
#{ 
#  age = {
#    secrets = {
#      secret1 = {
#         file = "${inputs.self}/secrets/secret1.age";
#         owner = "dbochoa77";
#         group = "dbochoa77";
#         path = "home/dbochoa77/.secret1";
#        };
#      };
#    };
#  }
