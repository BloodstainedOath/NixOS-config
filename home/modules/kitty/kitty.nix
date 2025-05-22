{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;

    font = {
      name = "GoMono Nerd Font";
      size = 11;
    };

    settings = {
      confirm_os_window_close = 0;
      enable_audio_bell = "no";
      background = "#1a1b26";
      foreground = "#c0caf5";
      cursor = "#c0caf5";
      cursor_shape = "line";
      selection_foreground = "#000000";
      selection_background = "#c0caf5";
      window_margin_width = "8";
    };

    keybindings = {
      "ctrl+shift+enter" = "new_window";
      "ctrl+shift+t" = "new_tab";
      "ctrl+shift+w" = "close_tab";
      "ctrl+shift+right" = "next_tab";
      "ctrl+shift+left" = "previous_tab";
    };

    extraConfig = ''
      # You can include a custom theme here if you want
      # include ~/.cache/wal/colors-kitty.conf
    '';
  };
}
