{ config, pkgs, ... }:

{
  home.username = "akk";
  home.homeDirectory = "/home/akk";
  home.stateVersion = "23.05";
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    htop
    thefuck
    gnome.eog
    nixpkgs-fmt
    rar
    zip
    unzip
    chezmoi

    # programming
    rustup

    # gaming
    steam

    # compat
    wineWowPackages.stable
    winetricks
    bottles
    lutris

    # school
    speedcrunch

  ];

  programs.git = {
    enable = true;
    userName = "antoKeinanen";
    userEmail = "anto.keinanen@gmail.com";
  };

  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Macchiato-Compact-Pink-dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "pink" ];
        size = "compact";
        tweaks = [ "rimless" "black" ];
        variant = "macchiato";
      };
    };
  };


  home.sessionPath = [
    "$HOME/.cargo/bin"
  ];
}
