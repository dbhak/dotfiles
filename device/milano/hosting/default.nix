{pkgs, ...}: let
  cockpitPodman = pkgs.callPackage ./cockpitPodman.nix {};
in {
  environment.systemPackages = with pkgs; [
  ];

  users.groups.hosting = {
    gid = 900;
  };

  users.users."ak".extraGroups = ["hosting"];

  systemd.tmpfiles.rules = [
    "d /config/crafty/backups 0775 - hosting - -"
    "d /config/crafty/logs 0775 - hosting - -"
    "d /config/crafty/servers 0775 - hosting - -"
    "d /config/crafty/config 0775 - hosting - -"
    "d /config/crafty/import 0775 - hosting - -"
  ];

  # Enable Podman
  virtualisation.podman.enable = true;
  virtualisation.podman.dockerCompat = true;

  virtualisation.oci-containers.containers = {
    crafty = {
      image = "arcadiatechnology/crafty-4:latest";
      ports = [
        "8443:8443"
        "8123:8123"
        "19132:19132/udp"
        "25500-25600:25500-25600"
      ];
      environment = {
        TZ = "Etc/UTC";
      };
      volumes = [
        "/config/crafty/backups:/crafty/backups"
        "/config/crafty/logs:/crafty/logs"
        "/config/crafty/servers:/crafty/servers"
        "/config/crafty/config:/crafty/app/config"
        "/config/crafty/import:/crafty/import"
      ];
      autoStart = true;
    };
  };
}
