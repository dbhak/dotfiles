{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.noctalia.homeModules.default
  ];

  # configure options
  #
  # Schema is noctalia v5+ (config.toml, not the old settings.json shape).
  # `bar.widgets` is a *named* bar (auto-named "widgets" since that's the
  # table we define) - position/thickness/etc live inside it, and the old
  # left/center/right widget groups are now start/center/end plain string
  # arrays (no per-widget option objects). `noctalia config validate` is
  # the source of truth if this drifts again.
  programs.noctalia = {
    enable = true;
    systemd.enable = true;
    settings = {
      bar.widgets = {
        position = "bottom";
        start = ["control-center" "network" "bluetooth"];
        center = ["workspaces"];
        end = ["clock" "microphone"];
      };

      theme = {
        mode = "dark";
        source = "wallpaper";
        templates = {
          enable_builtin_templates = true;
          enable_community_templates = true;
        };
      };

      wallpaper = {
        enabled = true;
        directory = "/home/ak/Pictures/Wallpapers";
        transition_duration = 1500.0;
        automation = {
          enabled = true;
          order = "random";
          interval_seconds = 300;
        };
      };

      location = {
        address = "Sydney, Australia";
      };
    };
    # this may also be a string or a path to a JSON file.
  };
}
