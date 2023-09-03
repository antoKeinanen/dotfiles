{ config, pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    shellAliases = {
      la = "ls -la";
      update-nix = "sudo nixos-rebuild switch";
      edit-nix = "sudo nano /etc/nixos/configuration.nix";
      update-home = "nix run ~/.config/home-manager -- switch --flake ~/.config/home-manager";
      edit-home = "code ~/.config/home-manager/";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "thefuck" ];
      theme = "cypher";
    };
  };
}
