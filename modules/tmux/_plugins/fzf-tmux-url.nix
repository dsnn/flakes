{ pkgs, ... }:
let
  package = pkgs.tmuxPlugins.fzf-tmux-url;
  name = package.meta.description or "";
  description = package.meta.description or "";
in
{
  inherit name description package;

  extraConfig = '''';
}
