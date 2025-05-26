{ config, lib, pkgs, ... }:

{
  # Waypaper configuration
  xdg.configFile."waypaper/config.ini".text = ''
    [Settings]
    language = en
    folder = ~/Pictures/Knight
    wallpaper = 
    show_path_in_tooltip = True
    backend = swww
    monitors = All
    fill = fit
    sort = name
    color =rgb(0, 0, 0)
    subfolders = true
    number_of_columns = 4
    post_command = wallust run $wallpaper
    swww_transition_type = wipe
    swww_transition_step = 90
    swww_transition_angle = 45
    swww_transition_duration = 3
    swww_transition_fps = 60
    swww_transition_bezier = .43,1.19,1,.4
    swww_transition_wave = 20,20
    show_hidden = false
    show_gifs_only = false
    use_xdg_state = false
    mpvpaper_sound = False
    mpvpaper_options = 
    use_xdg_state = False
  '';
}