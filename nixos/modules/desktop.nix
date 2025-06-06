{config, pkgs, inputs, ...}:

{

programs.hyprland = {
  enable = true;
  xwayland.enable = true;
  package = inputs.hyprland.packages."${pkgs.system}".hyprland;
};

environment.sessionVariables = {
  NIXOS_OZONE_WL = "1";
};

}
