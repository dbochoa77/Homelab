{ lib, config, pkgs, ... }:
{
  users.groups.media = { };

  # Calibre-Web
  services.calibre-web = {
    enable = true;
    group = "media";
    listen = {
      ip = "127.0.0.1";
      port = 8083;
    };
    options = {
      calibreLibrary = "/tank/media/ebook";
      enableBookUploading = true;
      enableBookConversion = true;
    };
  };   
}
