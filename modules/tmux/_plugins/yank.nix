{ pkgs, ... }:
let
  package = pkgs.tmuxPlugins.yank;
  name = package.meta.description or "Better clipboard integration";
  description = package.meta.description or "";
in
{
  inherit name description package;

  extraConfig = '''';
}
