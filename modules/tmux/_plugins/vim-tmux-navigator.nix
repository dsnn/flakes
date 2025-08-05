{ pkgs, ... }:
let
  package = pkgs.tmuxPlugins.vim-tmux-navigator;
  name = package.meta.description or "";
  description = package.meta.description or "";
in
{
  inherit name description package;

  extraConfig = '''';
}
