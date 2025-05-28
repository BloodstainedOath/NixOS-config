{ config, pkgs, ... }:

{
  # Enable fastfetch and install the package
  home.packages = with pkgs; [
    fastfetch
  ];

  # Create fastfetch configuration
  xdg.configFile."fastfetch/config.jsonc".text = ''
    {
      "$schema": "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json",
      "logo": {
        "source": "auto",
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
        "display",
        "de",
        "wm",
        "wmtheme",
        "theme",
        "icons",
        "font",
        "cursor",
        "terminal",
        "terminalfont",
        "cpu",
        "gpu",
        "memory",
        "swap",
        "disk",
        "localip",
        "battery",
        "poweradapter",
        "locale",
        "break",
        "colors"
      ]
    }
  '';

  # Optional: Create shell aliases for fastfetch
  home.shellAliases = {
    ff = "fastfetch";
    neofetch = "fastfetch";  # Replace neofetch if you used it before
  };
}