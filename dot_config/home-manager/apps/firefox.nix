{ config, pkgs, firefox-addons, ... }:
{
  programs.firefox = {
    enable = true;
    profiles.akk = { 
      name = "akk";

      extensions = with firefox-addons.packages."x86_64-linux"; [
        bitwarden
        ublock-origin
        sponsorblock
        darkreader
        sponsorblock
        firefox-color
      ];
    };
  };
}
