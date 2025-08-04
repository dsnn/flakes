{ pkgs, ... }:
let
  package = pkgs.tmuxPlugins.tilish;
  name = package.meta.description or "";
  description = package.meta.description or "";
in
{
  inherit name description package;

  extraConfig = '''';
}
