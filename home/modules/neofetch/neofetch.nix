{ config, pkgs, ... }:

{
  programs.neofetch = {
    enable = true;
    settings = {
      # Information to display
      print_info = ''
        info title
        info underline

        info "OS" distro
        info "Host" model
        info "Kernel" kernel
        info "Uptime" uptime
        info "Packages" packages
        info "Shell" shell
        info "Resolution" resolution
        info "DE" de
        info "WM" wm
        info "WM Theme" wm_theme
        info "Theme" theme
        info "Icons" icons
        info "Terminal" term
        info "Terminal Font" term_font
        info "CPU" cpu
        info "GPU" gpu
        info "Memory" memory

        # info "GPU Driver" gpu_driver  # Linux/macOS only
        # info "CPU Usage" cpu_usage
        # info "Disk" disk
        # info "Battery" battery
        # info "Font" font
        # info "Song" song
        # [[ "$player" ]] && prin "Music Player" "$player"
        # info "Local IP" local_ip
        # info "Public IP" public_ip
        # info "Users" users
        # info "Locale" locale  # This only works on glibc systems.

        info cols
      '';

      # Title
      title_fqdn = "off";

      # Kernel
      kernel_shorthand = "on";

      # Distro
      distro_shorthand = "off";
      os_arch = "on";

      # Uptime
      uptime_shorthand = "on";

      # Memory
      memory_percent = "off";
      memory_unit = "mib";

      # Packages
      package_managers = "on";

      # Shell
      shell_path = "off";
      shell_version = "on";

      # CPU
      speed_type = "bios_limit";
      speed_shorthand = "off";
      cpu_brand = "on";
      cpu_speed = "on";
      cpu_cores = "logical";
      cpu_temp = "off";

      # GPU
      gpu_brand = "on";
      gpu_type = "all";

      # Resolution
      refresh_rate = "off";

      # Gtk Theme / Icons / Font
      gtk_shorthand = "off";
      gtk2 = "on";
      gtk3 = "on";

      # IP Address
      public_ip_host = "http://ident.me";
      public_ip_timeout = 2;
      local_ip_interface = "auto";

      # Desktop Environment
      de_version = "on";

      # Disk
      disk_show = [ "/" "/dev/shm" ];
      disk_subtitle = "mount";
      disk_percent = "on";

      # Song
      music_player = "auto";
      song_format = "%artist% - %album% - %title%";
      song_shorthand = "off";
      mpc_args = "";

      # Text Colors
      colors = [ 4 6 1 8 8 6 ];

      # Text Options
      bold = "on";
      underline_enabled = "on";
      underline_char = "-";
      separator = ":";

      # Color Blocks
      block_range = [ 0 15 ];
      color_blocks = "on";
      block_width = 3;
      block_height = 1;
      col_offset = "auto";

      # Progress Bars
      bar_char_elapsed = "-";
      bar_char_total = "=";
      bar_border = "on";
      bar_length = 15;
      bar_color_elapsed = "distro";
      bar_color_total = "distro";
      cpu_display = "off";
      memory_display = "off";
      battery_display = "off";
      disk_display = "off";

      # Backend Settings
      image_backend = "ascii";
      image_source = "auto";

      # Ascii Options
      ascii_distro = "auto";
      ascii_colors = [ 4 6 1 8 8 6 ];
      ascii_bold = "on";

      # Image Options
      crop_mode = "normal";
      crop_offset = "center";
      image_size = "auto";
      gap = 3;
      yoffset = 0;
      xoffset = 0;
      background_color = "";

      # Misc Options
      stdout = "off";
    };
  };
}