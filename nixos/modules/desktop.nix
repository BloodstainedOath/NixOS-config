{config, pkgs, ...}:

{

programs.hyprland = {
  enable = true;
  xwayland.enable = true;
};

environment.sessionVariables = {
  NIXOS_OZONE_WL = "1";
};

hardware = {
  graphics.enable = true;
  nvidia.modesetting.enable = true;
};

}
