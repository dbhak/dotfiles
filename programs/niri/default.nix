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

      animations = {
        enabled = false;
      };
      env = [
        "XCURSOR_THEME,Bibata-Modern-Classic"
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_THEME,Bibata-Modern-Classic"
        "HYPRCURSOR_SIZE,24"
      ];
      exec-once = [
        "hyprctl setcursor Bibata-Modern-Classic 24"
      ];
    };
  };
}
