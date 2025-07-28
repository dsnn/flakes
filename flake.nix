{
  description = "meta-flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.05";
    flake-utils.url = "github:numtide/flake-utils";
    neovim-flake = {
      url = "./neovim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      nixpkgs-stable,
      flake-utils,
      neovim-flake,
    }:
    flake-utils.lib.eachDefaultSystem (system:
    # let
    #   pkgs = nixpkgs.legacyPackages.${system};
    # in
    {
      packages = {
        neovim = neovim-flake.packages.${system}.default;
      };
      # formatter = pkgs.alejandra;
    });
}
