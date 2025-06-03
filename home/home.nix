{ config, pkgs, inputs, ... }:

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
    ./modules/neofetch/neofetch.nix
    inputs.spicetify-nix.homeManagerModules.default
  ];

  home.username = "hunter";
  home.homeDirectory = "/home/hunter";

  home.packages = with pkgs; [
    sweet
    firefox-devedition
    vlc
    eog
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
    qbittorrent
    protonvpn-gui
    vesktop
    hyprlock
    libreoffice-qt6-fresh
    materialgram
    fastfetch
    obs-studio
    evince
    thunderbird
    nautilus
    spotdl
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
    alias py='cd /home/hunter/.dots && nix develop .#python --command zsh'
    alias crust='cd /home/hunter/.dots && nix develop .#cppRust --command zsh'
  '';
};

gtk = {
  enable = true;
  theme.name = "Sweet-Dark";
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
  platformTheme.name = "gtk";
};

programs.spicetify =
let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
in
{
  enable = true;
  theme = spicePkgs.themes.defaultDynamic;
  enabledExtensions = with spicePkgs.extensions; [
    adblock
    shuffle
    beautifulLyrics
    hidePodcasts
    betterGenres
  ];
};

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.stateVersion = "24.11";
}
