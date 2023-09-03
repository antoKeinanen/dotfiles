{ config, pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      bbenoist.nix
      catppuccin.catppuccin-vsc
      pkief.material-icon-theme
      github.copilot
      esbenp.prettier-vscode
      rust-lang.rust-analyzer
      serayuzgur.crates
      njpwerner.autodocstring
      jnoortheen.nix-ide
    ];
  };
}
