{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland.settings = {
    input = {
      kb_layout = "us";
      kb_variant = "";
      kb_model = "";
      kb_options = "";
      kb_rules = "";

      follow_mouse = 1;
      sensitivity = 0;

      touchpad = {
        disable_while_typing = true;
        natural_scroll = true;
      };
    };

    gestures = {
      workspace_swipe = true;
    };
  };
}
