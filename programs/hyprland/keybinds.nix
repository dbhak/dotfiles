{
  config,
  pkgs,
  inputs,
  ...
}: let
  mod = "CTRL";
in {
  # Configuration stuff ...
  imports = [
  ];

  wayland.windowManager.hyprland = {
    settings = {
      bind =
        [
          "${mod}, RETURN, exec, $terminal"
          "${mod}, Q, killactive"
          "${mod}, D, exec, noctalia-shell ipc call launcher toggle"

          ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%+"
          ", XF86AudioLowerVolume, exec, wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%-"
          ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ]
        ++ (
          # workspaces
          # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
          builtins.concatLists (builtins.genList (
              i: let
                ws = i + 1;
              in [
                "${mod}, code:1${toString i}, workspace, ${toString ws}"
                "${mod} SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
              ]
            )
            9)
        );
    };
  };
}
