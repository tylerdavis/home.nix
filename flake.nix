{
  description = "Example nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    darwin.url = "github:LnL7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    stylix.url = "github:danth/stylix";
  };

  outputs = inputs@{ self, darwin, home-manager, nixpkgs, stylix }: {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#Tylers-MacBook-Pro

    darwinConfigurations."GraphBook" = darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [
    	  stylix.darwinModules.stylix
        ./darwin.nix
        home-manager.darwinModules.home-manager {
          nixpkgs.overlays = [ (import ./overlays/llm-claude3.nix) ];
    	    users.users.tmd.home = "/Users/tmd";
    	    home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.tmd = import ./home.nix;
          };
        }
      ];
    };
  };
}
