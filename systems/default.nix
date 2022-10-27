{ config, pkgs, ... }:

{
  imports = [
    <home-manager/nixos>
    # ./wayland
    ./xorg
    ./terminal
    ./development
    ./browser
    ./office
    ./social
    ./multimedia
    ./misc
  ];

  system.stateVersion = "22.05";
  home-manager.sharedModules = [{
    home.stateVersion = "22.05";
  }];

  xdg.mime.defaultApplications = {
    "text/html" = "librewolf.desktop";
    "text/xml" = "librewolf.desktop";
    "x-scheme-handler/ftp" = "librewolf.desktop";
    "x-scheme-handler/http" = "librewolf.desktop";
    "x-scheme-handler/https" = "librewolf.desktop";
  };

  nixpkgs.config = {
    allowUnfree = true;
  };

  nix.settings = {
    experimental-features = [ "nix-command" ];
    trusted-substituters = [ "file:///tmp/store/" ];
    trusted-users = [ "root" "@wheel" ];
  };

  networking.networkmanager.enable = true;
  time.timeZone = "Asia/Jakarta";
  i18n.defaultLocale = "en_US.UTF-8";

  boot = {
    plymouth.enable = true;
    initrd.verbose = false;
    consoleLogLevel = 0;
    kernelParams = [ "quiet" "udev.log_level=3" ];
  };
}
