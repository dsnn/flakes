{ config, ... }:
{
  text.readme = {

    parts.intro =
      # markdown
      ''
        # Flakes 

        Repository for standalone tools, powered by [nix](https://nix.dev/).

      '';
  };

  perSystem =
    { pkgs, ... }:
    {
      files.files = [
        {
          path_ = "README.md";
          drv = pkgs.writeText "README.md" config.text.readme;
        }
      ];
    };
}
