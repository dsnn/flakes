{
  description = "my flakes";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.05";
    files.url = "github:mightyiam/files";
    flake-utils.url = "github:numtide/flake-utils";
    import-tree.url = "github:vic/import-tree";
    make-shell.url = "github:nicknovitski/make-shell";
    nixvim.url = "github:nix-community/nixvim";
  };

  outputs =
    { flake-parts, ... }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-darwin"
      ];
      imports = [
        (inputs.import-tree ./modules)
        inputs.files.flakeModules.default
      ];
      _module.args.rootPath = ./.;
    };
}
