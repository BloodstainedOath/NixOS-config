{ config, pkgs, ... }:

{
  # 🚀 Load the NVIDIA kernel module at boot — required for proper driver function
  boot.kernelModules = [ "nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm" ];

  # 📦 Use the beta proprietary NVIDIA driver package
  boot.extraModulePackages = [ config.boot.kernelPackages.nvidiaPackages.beta ];

  # 🖥️ Instruct X/Wayland to use NVIDIA instead of open-source drivers
  services.xserver.videoDrivers = [ "nvidia" ];

  # ⚙️ NVIDIA driver configuration
  hardware.nvidia = {
    modesetting.enable = true;      # Enables Kernel Mode Setting (KMS) — necessary for Wayland
    powerManagement.enable = true; # Keep GPU always active — best performance (no power-saving)
    powerManagement.finegrained = false;
    open = false;                   # Use proprietary driver, not the open-source variant
    nvidiaSettings = true;          # Installs `nvidia-settings` GUI tool for manual tweaking
    nvidiaPersistenced = true;
    videoAcceleration = true;
    package = config.boot.kernelPackages.nvidiaPackages.beta; # Use the beta driver
  };

  # 🛑 Prevent conflict with Nouveau (open-source NVIDIA driver)
  boot.blacklistedKernelModules = [ "nouveau" ];

  # ✅ FIXED: CPU governor setup — full performance
  services.tlp.enable = true;
  services.tlp.settings = {
    CPU_SCALING_GOVERNOR_ON_AC = "performance";
    CPU_SCALING_GOVERNOR_ON_BAT = "performance";
  };


  # 🖼️ Wayland-specific environment variables for best NVIDIA support
  environment.variables = {
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";  # Ensure OpenGL uses NVIDIA GLX
    WLR_NO_HARDWARE_CURSORS = "1";         # Prevents cursor glitches on Wayland/NVIDIA
    LIBVA_DRIVER_NAME = "nvidia";          # Enables NVIDIA hardware-accelerated video decoding
    GBM_BACKEND = "nvidia-drm";            # Use GBM backend instead of EGLStreams (Wayland compatibility)
    __GL_SYNC_TO_VBLANK = "0";
    __GL_GSYNC_ALLOWED = "0";              # Disable G-Sync — improves stability
    __GL_VRR_ALLOWED = "0";                # Disable Variable Refresh Rate
  };

  # 🧱 Enables NVIDIA's Direct Rendering Manager for smooth Wayland/X11 operation
  boot.kernelParams = [
    "nvidia-drm.modeset=1"
  ];

  # 🔍 Useful tools for performance monitoring and control
  environment.systemPackages = with pkgs; [
    glxinfo               # Check OpenGL info (e.g., GPU renderer)
    btop                  # Modern system resource monitor
    lm_sensors            # CPU temps, fan speeds, etc.
    vulkan-loader              # Core Vulkan runtime (must-have)
    vulkan-tools               # Tools like `vulkaninfo` and `cube`
    vulkan-validation-layers   # Helps validate Vulkan app behavior (useful for devs, can be skipped if not needed)
    vkbasalt                   # Optional: Vulkan post-processing layer (e.g., sharpening, FXAA)
    mangohud                   # Vulkan/OpenGL overlay for performance stats (FPS, CPU/GPU load)
    cudaPackages.cudatoolkit
  ];

  # Optional: Enable this block if you want to *force NVIDIA GPU always-on*

  hardware.nvidia.prime = {
    sync.enable = true;              # Enable PRIME Sync — prevents tearing
    nvidiaBusId = "PCI:01:00:0";       # Replace with your actual NVIDIA GPU bus ID
    intelBusId = "PCI:00:02:0";        # Replace with your integrated GPU bus ID
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  services.fstrim.enable = true;
  services.thermald.enable = true;

}
