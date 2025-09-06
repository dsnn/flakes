{
  plugins = {
    fzf-lua = {
      enable = true;
      keymaps = {
        "<Leader><space>" = {
          action = "buffers";
          settings = {
            winopts = {
              split = "botright new";
            };
          };
          options = {
            desc = "Show buffers";
          };
        };
        "<space>gb" = {
          action = "git_branches";
          options = {
            desc = "Show git branches";
          };
          # settings = {
          #   winopts = {
          #     height  =
          #   };
          # };
        };
        "<space>gc" = {
          action = "git_bcommits";
          options = {
            desc = "Show buffer git commits";
          };
        };
        "<space>gf" = {
          action = "git_files";
          options = {
            desc = "Show git files";
          };
        };
        "<space>gs" = {
          action = "git_status";
          options = {
            desc = "Show git status";
          };
        };
        "<space>sa" = {
          action = "files";
          options = {
            desc = "Find files";
          };
        };
        "<space>sc" = {
          action = "colorschemes";
          options = {
            desc = "Select colorscheme";
          };
        };
        "<space>sd" = {
          action = "files";
          options = {
            desc = "Find dotfiles";
            # path = "~/.dotfiles";
          };
        };
        "<space>sw" = {
          action = "grep_cword";
          options = {
            desc = "Search word under cursor";
          };
        };
        "<space>sW" = {
          action = "grep_cWORD";
          options = {
            desc = "Search WORD under cursor";
          };
        };
        "<space>sg" = {
          action = "live_grep";
          options = {
            desc = "Live grep current project";
          };
        };
        "<space>sh" = {
          action = "helptags";
          options = {
            desc = "Show help tags";
          };
        };
        "<space>sk" = {
          action = "keymaps";
          options = {
            desc = "Show keymaps";
          };
        };
        "<space>sl" = {
          action = "resume";
          options = {
            desc = "Resume last query";
          };
        };
        "<space>sq" = {
          action = "quickfix";
          options = {
            desc = "Show quickfix";
          };
        };
        "<space>sr" = {
          action = "oldfiles";
          options = {
            desc = "Open files history";
          };
        };
      };

      # keymaps = {
      #   "<Leader><space>" = "buffers";
      #   "<space>gb" = {
      #     action = "git_branches";
      #     options = {
      #       silent = true;
      #       desc = "Show git branches";
      #     };
      #   };
      #   "<space>gf" = {
      #     action = "git_files";
      #     settings = {
      #       previewers.cat.cmd = lib.getExe' pkgs.coreutils "cat";
      #       winopts.height = 0.5;
      #     };
      #     options = {
      #       silent = true;
      #       desc = "Fzf-Lua Git Files";
      #     };
      #   };
      # };

    };
  };
}
