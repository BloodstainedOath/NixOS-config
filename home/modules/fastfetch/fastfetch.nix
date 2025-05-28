{ config, pkgs, ... }:

{
  # Create fastfetch configuration
  xdg.configFile."fastfetch/config.jsonc".text = ''
    {
      "$schema": "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json",
      "logo": {
        "source": "`find $HOME/Pictures/icons -type f | shuf -n 1`",
        "type": "auto",
        "width": 35,
        "height": 20,
        "padding": {
          "top": 1,
          "left": 2
        }
      },
      "display": {
        "separator": " -> "
      },
      "modules": [
        {
          "type": "title",
          "color": {
            "1": "blue",
            "2": "yellow"
          }
        },
        "separator",
        "os",
        "host",
        "kernel",
        "uptime",
        "packages",
        "shell",
        "break",
        "cpu",
        "gpu",
        "memory",
        "disk",
        "break",
        "de",
        "wm",
        "wmtheme",
        "theme",
        "icons",
        "font",
        "cursor",
        "break",
        "terminal",
        "terminalfont"
      ]
    }
  '';
}