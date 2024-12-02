{ config, pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    autosuggestion = {
      enable = true;
    };

    shellAliases = {
      lg = "lazygit";
    };

    initExtra = "export PATH=$PATH:/Applications/kitty.app/Contents/MacOS\n";

    history = {
      extended = true;
      ignoreAllDups = true;
    };

    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins= [
        "direnv"
      ];
    };

    dirHashes = {
      docs  = "$HOME/Documents";
      dev   = "$HOME/Development";
      dl    = "$HOME/Downloads";
    };
  };
}
