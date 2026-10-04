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
  ];

	services.teamspeak3.enable = true;


}
