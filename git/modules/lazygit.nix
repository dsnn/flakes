{ config, lib, ... }:
with lib;
let
  cfg = config.dsn.lazygit;
in
{

  options.dsn.lazygit = {
    enable = mkEnableOption "Enable lazygit";
  };

  config = mkIf cfg.enable {
    programs.lazygit = {
      enable = true;
      settings = {
        git = {
          paging = {
            colorArg = "always";
            pager = "delta --color-only --dark --paging=never";
            useConfig = false;
          };
        };
      };
    };

    programs.zsh.initContent = ''
      function run_lazy_git() {
        BUFFER="lazygit && clear"
        zle accept-line
      }
      zle -N run_lazy_git
      bindkey "^g" run_lazy_git
    '';
  };
}
