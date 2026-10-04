{
  config,
  pkgs,
  inputs,
  ...
}: let
  mod = "ALT";
in {
  # Configuration stuff ...
  imports = [
    ./noctalia.nix
    ./keybinds.nix
    ./gtk.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    settings = {
      "$terminal" = "alacritty";
      "$fileManager" = "nemo";

      # Dell AW3926QW 5k2k: native res at full refresh rate
      monitor = [
        # bitdepth 10 needed for HDR; Hyprland auto-switches to HDR for fullscreen HDR apps
        "DP-1,5120x2160@165,0x0,1.333333,bitdepth,10"
        ",preferred,auto,auto"
      ];

      # Let XWayland apps (Steam, games) render at native res instead of being upscaled
      xwayland = {
        force_zero_scaling = true;
      };

      animations = {
        enabled = false;
      };
      env = [
        "XCURSOR_THEME,Bibata-Modern-Classic"
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_THEME,Bibata-Modern-Classic"
        "HYPRCURSOR_SIZE,24"
        # Electron/Chromium apps (Discord etc.) run native Wayland so they scale sharply
        "NIXOS_OZONE_WL,1"
        # Steam runs under XWayland (zero-scaled), so scale its UI to match the monitor
        "STEAM_FORCE_DESKTOPUI_SCALING,1.333333"
      ];
      exec-once = [
        "hyprctl setcursor Bibata-Modern-Classic 24"
      ];
    };
  };
}
