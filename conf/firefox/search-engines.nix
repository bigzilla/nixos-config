{ pkgs }:

let
  icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
in
{
  force = true;
  default = "Brave Search";
  order = [
    "Brave Search"
    "DuckDuckGo"
    "Google"
    "Wikipedia (en)"
    "Nix Packages"
    "NixOS Options"
    "NixOS Wiki"
  ];
  engines = {
    "Brave Search" = {
      icon = ./brave-favicon.png; # https://brave.com/static-assets/images/brave-favicon.png
      urls = [{ template = "https://search.brave.com/search?q={searchTerms}"; }];
      definedAliases = [ "@b" ];
    };
    "Nix Packages" = {
      inherit icon;
      urls = [{ template = "https://search.nixos.org/packages?type=packages&query={searchTerms}"; }];
      definedAliases = [ "@np" ];
    };
    "NixOS Options" = {
      inherit icon;
      urls = [{ template = "https://search.nixos.org/options?type=packages&query={searchTerms}"; }];
      definedAliases = [ "@no" ];
    };
    "NixOS Wiki" = {
      inherit icon;
      urls = [{ template = "https://nixos.wiki/index.php?search={searchTerms}"; }];
      definedAliases = [ "@nw" ];
    };
    "Bing".metaData.hidden = true;
    "Amazon.com".metaData.hidden = true;
    "Google".metaData.alias = "@g";
    "DuckDuckGo".metaData.alias = "@d";
    "Wikipedia (en)".metaData.alias = "@wiki";
  };
}
