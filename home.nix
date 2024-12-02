{ pkgs, lib, ... }:

{
  home.username = "tmd";
  home.homeDirectory = lib.mkDefault "/Users/tmd";

  home.packages = [
    pkgs.nil
    pkgs._1password-cli
  ];

  home.file = {
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  home.stateVersion = "24.05"; # Please read the comment before changing.

  programs.home-manager.enable = true;    
  programs.direnv.enable = true;

  imports = [
    ./programs/eza.nix
    ./programs/fzf.nix
    ./programs/git.nix
    ./programs/helix.nix
    ./programs/kitty.nix
    ./programs/lazygit.nix
    ./programs/ripgrep.nix
    ./programs/zsh.nix
  ];
}
