{ pkgs, lib, ... }:
let
  llm-claude = pkgs.python311Packages.callPackage ./packages/llm-claude/default.nix {
    inherit (pkgs.python311Packages) anthropic;
  };

  llm-claude-3 = pkgs.python311Packages.callPackage ./packages/llm-claude-3/default.nix {
    inherit (pkgs.python311Packages) anthropic;
    inherit llm-claude;
  };

  pyWithLlm = pkgs.python3.withPackages (ps: [
    ps.llm
    llm-claude-3
  ]);

  llm-with-plugins = pkgs.writeShellScriptBin "llm" ''
    exec ${pyWithLlm}/bin/llm "$@"
  '';
in
{
  home.username = "tmd";
  home.homeDirectory = lib.mkDefault "/Users/tmd";

  home.packages = [
    pkgs.ghostty
    pkgs.nil
    pkgs._1password-cli
    pkgs.yq
    llm-with-plugins
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
  programs.vscode.enable = true;
  programs.nnn.enable = true;
  programs.fzf = {
    enable = true;
  };
  programs.gh.enable = true;

  # programs.ghostty = {
  #   enable = true;
  #   enableZshIntegration = true;
  # };

  imports = [
    ./programs/awscli.nix
    ./programs/eza.nix
    ./programs/fzf.nix
    ./programs/git.nix
    ./programs/helix.nix
    ./programs/kitty.nix
    ./programs/lazygit.nix
    ./programs/neovim/default.nix
    ./programs/spotify.nix
    ./programs/ripgrep.nix
    ./programs/zsh.nix
  ];
}
