{
  description = "NixOS + Sway + Home Manager";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/b691dee61b88d4f09db5e429b59a442d6753280e";

    home-manager = {
      url = "github:nix-community/home-manager/7b4c5ec4bedaf1e062bbc1bcaeddbc6bd242aa1b";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.amish = import ./home.nix;
        }
      ];
    };
  };
}
