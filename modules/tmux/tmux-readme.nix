{
  config,
  lib,
  withSystem,
  ...
}:
{
  text.readme.parts.tmux-plugins = withSystem (builtins.head config.systems) (
    { pkgs, ... }:
    let
      plugins = import ./_plugins.nix { inherit pkgs; };

      pluginRows = lib.mapAttrsToList (
        _: plugin:
        let
          meta = plugin.package.meta or { };
          desc = meta.description or plugin.description or "No description.";
          url = meta.homepage or meta.url or plugin.url or null;
          name = plugin.meta.name or plugin.name;
          nameCell = if url != null then "[${name}](${url})" else name;
        in
        ''
          #### ${nameCell}

          ${desc}
        ''
      ) plugins;
    in
    lib.concatLines ([ "### Tmux plugins\n" ] ++ pluginRows)
  );
}
