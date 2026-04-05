{pkgs, ...}: let
  cockpitPodman = pkgs.callPackage ./cockpitPodman.nix {};
in {
  environment.systemPackages = with pkgs; [
    cockpit # cockpit
    sscg 
    cockpitPodman
  ];

  services = {
    cockpit = {
      enable = true;
      port = 9090;
      openFirewall = true;
      settings = {
        WebService = {
          AllowUnencrypted = true;
          Origins = "http://10.11.12.201:9090";
        };
      };
    };

    nginx.virtualHosts."cockpit.milano.io" = {
      # addSSL = true;
      # enableACME = true;
      locations."/" = {
        proxyPass = "http://localhost:9090/";
        proxyWebsockets = true;
      };
    };
  };
}
