{ config, pkgs, ... }:

{
  imports = [
    ./autostart.nix
    ./animations.nix
    ./binds.nix
    ./appearance.nix
    ./layout.nix
    ./windowrule.nix
  ];


  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      monitor = [
        ",1920x1080@144,auto,1"
      ];

      cursor = {
        no_hardware_cursors = true;
      };

      #############
      ## Wallust ##
      #############

      source = "$HOME/.config/hypr/colors.conf";
    };
  };
}
