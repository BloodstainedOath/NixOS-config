{ config, pkgs, ... }:

{
  imports = [
    ./modules/hyprland/hyprland.nix
  ];

  home.username = "hunter";
  home.homeDirectory = "/home/hunter";

  home.packages = [
    pkgs.sweet
  ];

  home.file = {
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
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
  platformTheme.name = "gtk";
};


  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.stateVersion = "24.11";
}
