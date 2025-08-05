{ pkgs, ... }:
let
  package = pkgs.tmuxPlugins.tmux-fzf;
  name = package.meta.description or "";
  description = package.meta.description or "";
in
{
  inherit name description package;

  extraConfig = '''';
}
