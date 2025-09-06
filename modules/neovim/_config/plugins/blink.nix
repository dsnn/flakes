{
  plugins = {
    blink-cmp = {
      enable = true;
      setupLspCapabilities = true;
      settings = {
        completion = { };
        fuzzy = {
          use_frecency = true;
          use_proximity = true;
        };
        signature = {
          enabled = true;
          trigger.enabled = true;
          window.direction_priority = [
            "n"
            "s"
          ];
        };
        sources.default = [
          "lsp"
          "buffer"
          "snippets"
          "path"
        ];
        keymaps = {

          "<C-e>" = [
            "hide"
          ];
          # documentation
          "<C-b>" = [
            "scroll_documentation_up"
            "fallback"
          ];
          "<C-f>" = [
            "scroll_documentation_down"
            "fallback"
          ];
          "<C-space>" = [
            "show"
            "show_documentation"
            "hide_documentation"
          ];

          # navigation
          "<C-n>" = [
            "select_next"
            "fallback"
          ];
          "<C-p>" = [
            "select_prev"
            "fallback"
          ];

          "<S-Tab>" = [
            "snippet_backward"
            "fallback"
          ];
          "<Tab>" = [
            "snippet_forward"
            "fallback"
          ];

          "<Down>" = [
            "select_next"
            "fallback"
          ];
          "<Up>" = [
            "select_prev"
            "fallback"
          ];

          # accept
          "<C-y>" = [
            "select_and_accept"
          ];
          "<CR>" = [
            "select_and_accept"
          ];
        };
      };
    };
  };
}
