{
  description = "A very basic flake with rust-overlay";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    wall-utils.url = "git+https://codeberg.org/BitSyndicate/wall-utils";
    wall-utils.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit inputs;
        flake-self = self;
      };
      modules = [
        (import "${./.}/configuration.nix" { inherit self; })
        home-manager.nixosModules.home-manager
      ];
    };
    homeConfigurations = {
      chance = { ... }: {
        imports = [
          ./home-manager.nix
          inputs.wall-utils.homeManagerModules.wall-utils
        ];
      };
    };
  };

}
