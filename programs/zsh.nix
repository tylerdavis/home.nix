{ ... }:
{
  programs.zsh = {
    enable = true;
    autosuggestion = {
      enable = true;
    };

    shellAliases = {
      cat = "bat";
      lg = "lazygit";
      l = "lla";
    };

    initExtra = ''
      export PATH=$PATH:/Applications/kitty.app/Contents/MacOS\n
      rebuild () { darwin-rebuild switch --flake ~/.config/nix }
    '';

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
