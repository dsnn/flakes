{
  text.readme.parts.neovim =
    # markdown
    ''
      # Neovim 

      [nixvim](https://github.com/nix-community/nixvim) with configurations

      For more info, see [documentation](https://nix-community.github.io/nixvim/plugins/neo-tree/window/index.html)

    '';

  flake.modules.neovim = {
    module =
      { inputs, ... }:
      {
        perSystem =
          { system, ... }:
          let
            nixvimLib = inputs.nixvim.lib.${system};
            nixvim' = inputs.nixvim.legacyPackages.${system};
            nixvimModule = {
              inherit system;
              module = import ./_config;
            };
            nvim = nixvim'.makeNixvimWithModule nixvimModule;
          in
          {
            checks.default = nixvimLib.check.mkTestDerivationFromNixvimModule nixvimModule;

            packages.neovim = nvim;
          };
      };
  };
}
