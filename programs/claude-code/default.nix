{
  config,
  pkgs,
  inputs,
  ...
}
: {
  # Configuration stuff ...
  imports = [
    # Import anything to do with the terminal here
  ];

  environment.systemPackages = [
     pkgs.claude-code
  ];
}
