{ pkgs, lib, ... }:
let
  llm-claude = pkgs.python311Packages.callPackage ../packages/llm-claude/default.nix {
    inherit (pkgs.python311Packages) anthropic;
  };
  llm-claude-3 = pkgs.python311Packages.callPackage ../packages/llm-claude-3/default.nix {
    inherit (pkgs.python311Packages) anthropic;
    inherit llm-claude;

  };
  llmWithPlugins = pkgs.python311Packages.llm.withPlugins [ llm-claude-3 ];
in
{
  home.username = "tmd";
  home.homeDirectory = lib.mkDefault "/Users/tmd";

  home.packages = [
    pkgs.nil
    pkgs._1password-cli
    pkgs.yq
    pkgs.gh
    llmWithPlugins
  ];

  home.file = {
  };

  home.sessionVariables = {
    EDITOR = "hx";
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
