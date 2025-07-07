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
    # Hyprland/Wayland Desktop Environment
    waypaper
    swww
    wofi
    waybar
    hyprshot
    hyprlock
    swaynotificationcenter
    wallust
    wl-clipboard
    cliphist
    rofi
    hyprpicker
    hyprsunset

    # Multimedia & Graphics
    vlc
    eog
    imagemagick
    obs-studio
    upscayl
    youtube-music
    playerctl
    pavucontrol

    # Gaming
    gamemode
    gamescope
    heroic
    wineWowPackages.stable
    winetricks

    # Internet & Communication
    inputs.zen-browser.packages."${system}".default
    qbittorrent
    protonvpn-gui
    vesktop
    materialgram
    ayugram-desktop

    # Productivity & Office
    libreoffice-qt6-fresh
    evince
    nautilus

    # Development & Editors
    obsidian
    gedit

    # System Utilities & CLI Tools
    spotdl
    fzf
    yt-dlp

    # Gtk Themes
    sweet

    # misc
    gallery-dl
    instaloader
  ];

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
      alias fzf='fzf --exact'
      alias up='cd /home/hunter/.dots && nix flake update'
      alias update='cd /home/hunter/.dots && sudo nixos-rebuild switch --flake .'
      alias py='cd /home/hunter/.dots && nix develop .#python --command zsh'
      alias crust='cd /home/hunter/.dots && nix develop .#cppRust --command zsh'
    '';
  };

  gtk = {
    enable = true;
    theme = {
      name = "Sweet-Dark";
      package = pkgs.sweet;
    };
    iconTheme = {
      name = "BeautySolar";
    };
    cursorTheme = {
      name = "Bibata-Rainbow-Modern";
      size = 24;
    };
    font = {
      name = "Noto Serif";
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

    programs.vscode = {
    enable = true;
    # package=pkgs.vscodium;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      ms-python.python
      esbenp.prettier-vscode
      llvm-vs-code-extensions.vscode-clangd
      pkief.material-icon-theme
      ritwickdey.liveserver
      formulahendry.code-runner
      oderwat.indent-rainbow
      jnoortheen.nix-ide
      continue.continue
    ];
  };


  programs.home-manager.enable = true;

  home.stateVersion = "24.11";
}
