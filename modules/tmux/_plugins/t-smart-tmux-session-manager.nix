{ pkgs, ... }:
let
  package = pkgs.tmuxPlugins.t-smart-tmux-session;
  name = package.meta.description or "";
  description = package.meta.description or "";
in
{
  inherit name description package;

  extraConfig = '''';
}
