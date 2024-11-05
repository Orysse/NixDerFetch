{
  pkgs,
  username,
  ...
}:
{
  home.username = "${username}";
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "23.11";
  
  imports = [
    ./config
  ];

  home.file."Pictures/Wallpapers" = {
    source = ./Wallpapers;
    recursive = true;
  };

  programs.git = {
    enable = true;
    userName = "abel.chartier";
    userEmail = "abel.chartier@epita.fr";
  };

  fonts.fontconfig.enable = true;
  home.packages = [
    (pkgs.nerdfonts.override { fonts = [ "IosevkaTerm" ]; })
  ];

  # home-manager.enable = true;
}
