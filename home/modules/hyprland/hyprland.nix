{ config, pkgs, ... }:

{
  imports = [
    ./autostart.nix
    ./animations.nix
    ./binds.nix
    ./appearance.nix
    ./layout.nix
  ];


  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      monitor = [
        ",1920x1080@144,auto,1"
      ];

      # Keyboard layout
      # input.kb_layout = "us";

      # Basic appearance
      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
        # col.active_border = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        # col.inactive_border = "rgba(595959aa)";
      };

      decoration = {
        rounding = 10;
        blur = {
          enabled = true;
          size = 5;
          passes = 1;
        };
        # drop_shadow = true;
      };

      animations = {
        enabled = true;
        bezier = [ "easein, 0.36, 0, 0.66, -0.56" ];
        animation = [
          "windows, 1, 3, easein"
          "fade, 1, 3, easein"
          "workspaces, 1, 2, easein"
        ];
      };

      misc = {
        vfr = true;
        disable_hyprland_logo = true;
      };
    };
  };
}
