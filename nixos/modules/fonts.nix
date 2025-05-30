{ config, pkgs, ... }:

{
  fonts = {
    enableDefaultPackages = true;

    packages = with pkgs; [
      nerd-fonts.go-mono                       # 🎯 Go Mono programming font
      font-awesome                 # 🌟 Icon font (used in UIs like Waybar/Wofi)
      nerd-fonts.jetbrains-mono    # 🧠 Nerd Font (adds icons to terminal/UI)
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      dejavu_fonts
      liberation_ttf
      noto-fonts-color-emoji
      nerd-fonts.symbols-only
      cinzel
    ];
  };
}
