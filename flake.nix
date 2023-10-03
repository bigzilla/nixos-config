{
  description = "Minizilla's NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, ... }@inputs:
    let
      lib = import ./lib inputs;
    in
    {
      nixosConfigurations = lib.mkNixOS {
        work = {
          system = "aarch64-linux";
          machine = "vm/vmware-aarch64";
          user = "minizilla";
          hashedPassword = "$y$j9T$PBJ.vcjXKANpepO44J7Li/$SGY0lCPkgzTsc70/TJP9ADhkJpkqTGGCJpcF07TnmdA";
          resolution = { x = 2880; y = 1752; };
          dpi = 192;
        };

        quicksilver = {
          system = "aarch64-linux";
          machine = "vm/vmware-aarch64";
          user = "minizilla";
          hashedPassword = "$y$j9T$jmTClkK2hbljvadc2kkPF/$dtnPG2OntoiGxVJ7gLXh8pXebfghHNbLBtTFm7KUvy7";
          resolution = { x = 2880; y = 1752; };
          dpi = 192;
        };
      };

      darwinConfigurations.mba-m1 = lib.mkDarwin {
        system = "aarch64-darwin";
        machine = "darwin";
        user = "minizilla";
      };
    };
}
