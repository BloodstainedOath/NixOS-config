{ config, pkgs, ... }:

{
  imports = [
    ./modules/hyprland/hyprland.nix
    ./modules/kitty/kitty.nix
    ./modules/waybar/waybar.nix
    ./modules/wallust/wallust.nix
    ./modules/rofi/rofi.nix
    ./modules/swaync/swaync.nix
    ./modules/wlogout/wlogout.nix
    ./modules/hyprland/hyprlock.nix
  ];

  home.username = "hunter";
  home.homeDirectory = "/home/hunter";

  home.packages = with pkgs; [
    sweet
    firefox-devedition
    vlc
    eog
    nautilus
    waypaper
    swww
    wofi
    waybar
    hyprshot
    pavucontrol
    swaynotificationcenter
    wallust
    imagemagick
    rofi
    wl-clipboard
    cliphist
    playerctl
    gamemode
    upscayl
    youtube-music
    gamescope
    heroic
    wineWowPackages.stable
    winetricks
    protonup-qt
    qbittorrent
    protonvpn-gui
    vesktop
    hyprlock
    libreoffice-qt6-fresh
    kdePackages.dolphin
    materialgram
    vivaldi
  ];

  home.file = {
  };

   programs.zsh = {
  enable = true;

  oh-my-zsh = {
    enable = true;
    theme = "robbyrussell";
    plugins = [
      "git"
      "sudo"
      "extract"
      "colored-man-pages"
      "aliases"
    ];
  };

  initContent = ''
    # Nix store plugins
    source ${pkgs.zsh-autosuggestions}/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    source ${pkgs.zsh-syntax-highlighting}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

    # Aliases
    alias ls='lsd'
    alias cat='bat'
    alias ll='ls -al'
    alias up='cd /home/hunter/.dots && nix flake update'
    alias update='cd /home/hunter/.dots && sudo nixos-rebuild switch --flake .'
  '';
};

gtk = {
  enable = true;
  theme.name = "Sweet-Dark";
  # font.name = "Cinzel Decorative";
  theme.package = pkgs.sweet;


iconTheme = {
    name = "BeautySolar"; # Must match the folder name in ~/.icons or ~/.local/share/icons
    # Don't add a `package` if you installed it manually
  };
 cursorTheme = {
    name = "Bibata-Rainbow-Modern";
    size = 24;
  };
};
qt = {
  enable = true;
};


  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.stateVersion = "24.11";
}
