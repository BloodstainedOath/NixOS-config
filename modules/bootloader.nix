{ config, pkgs, ... }:

{
  boot.loader = {
    systemd-boot.enable = false;

    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev"; # UEFI systems don't need a device like /dev/sdX
    };

    efi = {
      canTouchEfiVariables = true;
    };
  };
}
