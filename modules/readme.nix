{ inputs, config, ... }:
{

  imports = [ inputs.make-shell.flakeModules.default ];

  text.readme = {
    order = [
      "intro"
      "neovim"
      "tmux"
      "links"
    ];

    parts.intro =
      # markdown
      ''
        # Flakes 

        Repository for standalone tools, powered by [nix](https://nix.dev/).

      '';

    parts.links = ''
      ## Links

      - [extrakto](https://github.com/laktak/extrakto)
      - [jakehamiltons tmux](https://github.com/jakehamilton/tmux)

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
