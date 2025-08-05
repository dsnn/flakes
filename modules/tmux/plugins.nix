{
  config,
  lib,
  withSystem,
  ...
}:
let
  plugins =
    { pkgs }:
    {
      extrakto = {
        package = pkgs.tmuxPlugins.extrakto;
        description = "";
        extraConfig = ''
          set -g @extrakto_split_direction "v"
          set -g @extrakto_clip_tool_run "tmux_osc52"
          set -g @extrakto_clip_tool "wl-copy"
        '';
      };

      theme = {
        package = pkgs.tmuxPlugins.catppuccin;
        description = "";
        extraConfig = ''
          set -g @catppuccin_flavour 'mocha'
          set -g @catppuccin_window_tabs_enabled on
          set -g @catppuccin_status_modules_right "application session"
        '';
      };

      tilish = {
        package = pkgs.tmuxPlugins.tilish;
        description = "";
        extraConfig = ''
          set -g @plugin 'jabirali/tmux-tilish'
        '';
      };

      fzf = {
        package = pkgs.tmuxPlugins.tmux-fzf;
        description = "";
        extraConfig = ''
          TMUX_FZF_LAUNCH_KEY="f"
        '';
      };

      navigator = {
        package = pkgs.tmuxPlugins.vim-tmux-navigator;
        description = "Seamless navigation between tmux panes and vim splits";
        extraConfig = ''
          set -g @plugin 'christoomey/vim-tmux-navigator'
          set -g @tilish-navigator 'on'
        '';
      };
    };
in
{
  text.readme.parts.tmux-plugins = withSystem (builtins.head config.systems) (
    { pkgs, ... }:
    let
      resolvedPlugins = plugins { inherit pkgs; };

      pluginRows = lib.mapAttrsToList (
        aname: plugin:
        let
          meta = plugin.package.meta or { };
          desc = meta.description or plugin.description or "No description.";
          url = meta.homepage or meta.url or null;
          name = plugin.meta.name or aname;
          nameCell = if url != null then "[${name}](${url})" else name;
        in
        ''
          #### ${nameCell}

          ${desc}
        ''
      ) resolvedPlugins;
    in
    lib.concatLines ([ "### Tmux plugins\n" ] ++ pluginRows)
  );
}
