{ config, lib, ... }:

let
  cfg = config.conf.syncthing;
in
{
  options.conf.syncthing = {
    enable = lib.mkEnableOption "syncthing";
    user = lib.mkOption {
      type = lib.types.str;
      default = "syncthing";
      description = "User to be used for running the Syncthing";
    };
  };
  config = lib.mkIf cfg.enable {
    services.syncthing = {
      enable = true;
      openDefaultPorts = true;
      user = cfg.user;
      configDir = "/home/${cfg.user}/.config/syncthing";
      settings = {
        folders = {
          "ssh" = {
            path = "~/.ssh";
            ignorePerms = false;
          };
          "gnupg" = {
            path = "~/.gnupg";
            ignorePerms = false;
          };
          "password-store" = {
            path = "~/.password-store";
            ignorePerms = false;
          };
          "document" = {
            path = "~/.document";
            ignorePerms = false;
          };
        };
      };
    };
  };
}
