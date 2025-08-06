{ pkgs }:
let
  plugins = {
    # whichkey = {
    #   name = "tmux-which-key";
    #   package = pkgs.tmuxPlugins.tmux-which-key;
    #   extraConfig = ''
    #     set -g @plugin 'alexwforsythe/tmux-which-key'
    #   '';
    # };

    # dotbar = {
    #   name = "dotbar";
    #   package = pkgs.tmuxPlugins.dotbar;
    #   extraConfig = ''
    #     set -g @plugin 'vaaleyard/tmux-dotbar'
    #   '';
    # };

    theme = {
      name = "catppuccin";
      package = pkgs.tmuxPlugins.catppuccin;
      extraConfig = ''
        set -g @catppuccin_flavour 'mocha'
        set -g @catppuccin_window_tabs_enabled on
        set -g @catppuccin_status_modules_right "application session"
      '';
    };

    tilish = {
      name = "tilish";
      package = pkgs.tmuxPlugins.tilish;
      extraConfig = ''
        set -g @plugin 'jabirali/tmux-tilish'
      '';
    };

    fzf = {
      name = "tmux-fzf";
      package = pkgs.tmuxPlugins.tmux-fzf;
      tmuxFile = "main";
      extraConfig = ''
        TMUX_FZF_LAUNCH_KEY="f"
      '';
    };

    navigator = {
      name = "vim-tmux-navigator";
      url = "https://github.com/christoomey/vim-tmux-navigator";
      package = pkgs.tmuxPlugins.vim-tmux-navigator;
      description = "Seamless navigation between tmux panes and vim splits";
      extraConfig = ''
        set -g @plugin 'christoomey/vim-tmux-navigator'
        set -g @tilish-navigator 'on'
      '';
    };
  };
in
plugins
