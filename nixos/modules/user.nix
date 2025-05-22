{ config, pkgs, ... }:

{
  users.defaultUserShell = pkgs.zsh;
  users.users.hunter = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      tree
    ];
  };

}
