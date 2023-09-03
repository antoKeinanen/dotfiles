{
  description = "Home Manager configuration of akk";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix.url = github:the-argus/spicetify-nix;

    firefox-addons = {
      url = gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons;
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
  };

  outputs = { nixpkgs, home-manager, spicetify-nix, firefox-addons, ... }: {
    defaultPackage.x86_64-linux = home-manager.defaultPackage.x86_64-linux;

    homeConfigurations = {
      "akk" = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          system = "x86_64-linux";
          config = { allowUnfree = true; };
        };

        extraSpecialArgs = { inherit firefox-addons spicetify-nix; };

        modules = [
          ./home.nix
          ./apps/spicetify.nix
          ./apps/vscode.nix
          ./apps/zsh.nix
          ./apps/firefox.nix
        ];
      };
    };
  };
}
