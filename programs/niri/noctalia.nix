{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.noctalia.homeModules.default
  ];

  # configure options
  programs.noctalia-shell = {
    enable = true;
    systemd.enable = true;
    settings = {
      # configure noctalia here
      bar = {
        density = "compact";
        position = "bottom";
        showCapsule = false;
        widgets = {
          left = [
            {
              id = "ControlCenter";
              useDistroLogo = true;
            }
            {
              id = "Network";
            }
            {
              id = "Bluetooth";
            }
          ];
          center = [
            {
              hideUnoccupied = false;
              id = "Workspace";
              labelMode = "index";
            }
          ];
          right = [
            {
              formatHorizontal = "HH:mm";
              formatVertical = "HH mm";
              id = "Clock";
              useMonospacedFont = true;
              usePrimaryColor = true;
            }
            {
              displayMode = "onhover";
              iconColor = "none";
              id = "Microphone";
              middleClickCommand = "pwvucontrol || pavucontrol";
              textColor = "none";
            }
          ];
        };
      };
      colorSchemes = {
        useWallpaperColors = true;
        predefinedScheme = "Monochrome";
        darkMode = true;
        schedulingMode = "off";
        manualSunrise = "06:30";
        manualSunset = "18:30";
        generationMethod = "faithful";
        monitorForColors = "";
      };
      templates = {
        activeTemplates = [
          {
            enabled = true;
            id = "alacritty";
          }
          {
            enabled = true;
            id = "code";
          }
          {
            enabled = true;
            id = "spicetify";
          }
          {
            enabled = true;
            id = "discord";
          }
          {
            enabled = true;
            id = "cava";
          }
          {
            enabled = true;
            id = "btop";
          }
          {
            enabled = true;
            id = "gtk";
          }
          {
            enabled = true;
            id = "hyprland";
          }
        ];
        enableUserTheming = false;
      };
      general = {
        avatarImage = "/home/drfoobar/.face";
        radiusRatio = 0.2;
      };
      wallpaper = {
        enabled = true;
        overviewEnabled = false;
        directory = "/home/ak/Pictures/Wallpapers";
        automationEnabled = true;
        wallpaperChangeMode = "random";
        randomIntervalSec = 300;
        transitionDuration = 1500;
      };

      location = {
        monthBeforeDay = false;
        name = "Sydney, Australia";
      };
    };
    # this may also be a string or a path to a JSON file.
  };
}
