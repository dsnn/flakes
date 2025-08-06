{ config, ... }:
{
  text.gitignore = ''
    result
    test
    result-*
    .direnv
    .pre-commit-config.yaml
    .DS_Store
  '';

  perSystem =
    { pkgs, ... }:
    {
      files.files = [
        {
          path_ = ".gitignore";
          drv = pkgs.writeText ".gitignore" config.text.gitignore;
        }
      ];
    };
}
