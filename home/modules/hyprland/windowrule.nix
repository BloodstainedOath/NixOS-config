{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland.settings = {

    windowrulev2 = [
      # Centered and floating dialogs
      "float, center, title:^(Open File)(.*)$"
      "float, center, title:^(Select a File)(.*)$"
      "float, center, title:^(Choose wallpaper)(.*)$"
      "float, center, title:^(Open Folder)(.*)$"
      "float, center, title:^(Save As)(.*)$"
      "float, center, title:^(Library)(.*)$"
      "float, center, title:^(File Upload)(.*)$"
      "float, center, title:^(Select App)(.*)$"

      # Picture-in-Picture
      "float, pin, move 69.5% 4%, title:^(Picture-in-Picture)$"

      # App pinning and sizing
      "pin, title:^(rofi - APPS)$"
      "float, title:^(Waypaper)$"
      "float, title:^(Proton VPN)$"
      "size 800 600, title:^(Proton VPN)$"
      "size 400 200, title:^(Select App)$"

      # Opacity rules
      "opacity 0.90 0.90, class:^(org.gnome.Nautilus)$"
      "opacity 0.80 0.90, class:^(kitty)$"

      # Floating btop in kitty
      "float, class:^(kitty)$, title:^(btop)$"

      # Firefox Dev tweaks
      "noborder, class:^(firefox-dev)$"
      "noshadow, class:^(firefox-dev)$"
    ];
  };
}
