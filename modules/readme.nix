{
  inputs,
  config,
  ...
}:
{

  imports = [ inputs.make-shell.flakeModules.default ];

  text.readme = {
    order = [
      "intro"
      "neovim"
      "tmux"
      "tmux-plugins"
    ];

    parts.intro =
      # markdown
      ''
        # Flakes 

        Repository for standalone tools, powered by [nix](https://nix.dev/).

      '';
  };

  perSystem =
    { pkgs, ... }@psArgs:
    {
      files.files = [
        {
          path_ = "README.md";
          drv = pkgs.writeText "README.md" config.text.readme;
        }
      ];

      make-shells.default.packages = [ psArgs.config.files.writer.drv ];
    };
}
