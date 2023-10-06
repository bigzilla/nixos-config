{
  description = "Minizilla's NixOS Configurations";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, flake-utils, ... }@inputs:
    let
      # This value determines the NixOS release from which the default
      # settings for stateful data, like file locations and database versions
      # on your system were taken. It's perfectly fine and recommended to leave
      # this value at the release version of the first install of this system.
      # Before changing this value read the documentation for this option
      # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
      stateVersion = "22.11";
      user = "minizilla";
      lib = import ./lib ({ inherit stateVersion; } // inputs);
    in
    {
      nixosConfigurations = lib.mkNixOS {
        work = {
          inherit user;
          system = "aarch64-linux";
          machine = "vm/vmware-aarch64";
          hashedPassword = "$y$j9T$PBJ.vcjXKANpepO44J7Li/$SGY0lCPkgzTsc70/TJP9ADhkJpkqTGGCJpcF07TnmdA";
          resolution = { x = 2880; y = 1752; };
          dpi = 192;
        };

        quicksilver = {
          inherit user;
          system = "aarch64-linux";
          machine = "vm/vmware-aarch64";
          hashedPassword = "$y$j9T$jmTClkK2hbljvadc2kkPF/$dtnPG2OntoiGxVJ7gLXh8pXebfghHNbLBtTFm7KUvy7";
          resolution = { x = 2880; y = 1752; };
          dpi = 192;
        };
      };

      darwinConfigurations = lib.mkDarwin {
        work = {
          user = "bigzilla";
          system = "aarch64-darwin";
          machine = "darwin";
        };
      };
    } // flake-utils.lib.eachDefaultSystem (system:
      let pkgs = import inputs.nixpkgs { inherit system; }; in
      { devShells.default = import ./shell.nix { inherit pkgs; }; }
    );
}
