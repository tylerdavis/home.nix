{ pkgs, lib, ... }:
# let
#   llm-claude-3 = pkgs.callPackage ./packages/llm-claude-3/default.nix { };
# in
{
  home.username = "tmd";
  home.homeDirectory = lib.mkDefault "/Users/tmd";

  home.packages = [
    pkgs.nil
    pkgs._1password-cli
    pkgs.yq
    pkgs.gh
    # (pkgs.python3.withPackages (ps: [ps.llm llm-claude-3 ]))
  ];

  home.file = {
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  home.stateVersion = "24.05"; # Please read the comment before changing.

  programs.home-manager.enable = true;    
  programs.direnv.enable = true;
  programs.bat.enable = true;

  imports = [
    ./programs/eza.nix
    ./programs/fzf.nix
    ./programs/git.nix
    ./programs/helix.nix
    ./programs/kitty.nix
    ./programs/lazygit.nix
    ./programs/ripgrep.nix
    ./programs/zsh.nix
    ./programs/awscli.nix
  ];
}
