# NixOS module (programs.steam is a system-level option, not home-manager)
{pkgs, ...}: {
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
    # GE-Proton ships Wine's Wayland driver, needed for HDR (PROTON_ENABLE_WAYLAND/PROTON_ENABLE_HDR)
    extraCompatPackages = [pkgs.proton-ge-bin];
    # package = with pkgs; steam.override { extraPkgs = pkgs: [ attr ]; };
  };
}
