{
  description = "my flakes";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.05";

    flake-utils.url = "github:numtide/flake-utils";

    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager/master";

    neovim-flake = {
      url = "./neovim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # shell-flake = {
    #   url = "./shell";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      nixpkgs-stable,
      flake-utils,
      home-manager,
      neovim-flake,
    }:
    let
      system = "";
    in
    {

      # homeManagerModules.default = import ./modules;
      # homeManagerModules.zsh = import ./modules/zsh.nix;
      # homeManagerModules.tmux = import ./modules/tmux.nix;

      packages = {
        neovim = neovim-flake.packages.${system}.default;
        # shell = terminal-flake.packages.${system}.default;
      };
    };
}
