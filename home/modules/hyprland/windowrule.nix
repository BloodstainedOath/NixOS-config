{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland.settings = {

  windowrule = [
    "center, title:^(Open File)(.*)$"
    "center, title:^(Select a File)(.*)$"
    "center, title:^(Choose wallpaper)(.*)$"
    "center, title:^(Open Folder)(.*)$"
    "center, title:^(Save As)(.*)$"
    "center, title:^(Library)(.*)$"
    "center, title:^(File Upload)(.*)$"
    "float, title:^(Open File)(.*)$"
    "float, title:^(Select a File)(.*)$"
    "float, title:^(Choose wallpaper)(.*)$"
    "float, title:^(Open Folder)(.*)$"
    "float, title:^(Save As)(.*)$"
    "float, title:^(Library)(.*)$"
    "float, title:^(File Upload)(.*)$"
  ];

  windowrulev2 = [
    # Picture-in-Picture
    "float, title:^(Picture-in-Picture)$"
    "pin, title:^(Picture-in-Picture)$"
    "move 69.5% 4%, title:^(Picture-in-Picture)$"

    # App pinning
    "pin, title:^(rofi - APPS)$"
    "float, title:^(Waypaper)$"
    "float, title:^(Proton VPN)$"
    "size 800 600, title:^(Proton VPN)$"


    # Opacity rules
    "opacity 0.90 0.90, class:^(org.gnome.Nautilus)$"
    "opacity 0.90 0.90, class:^(kitty)$"
    "float, class:^(kitty)$, title:^(btop)$"
    # Uncomment these if needed
    # "noborder, class:^(kitty)$"
    # "noshadow, class:^(kitty)$"
    ];
  };

}