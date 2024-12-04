{ pkgs, ... }: 

{
    environment.systemPackages = [
    ];

    services.nix-daemon.enable = true;

    nix = {
      package = pkgs.nix;
      settings = {
        experimental-features = "nix-command flakes";
      };
    };

    nixpkgs.config.allowUnfree = true;

    security = {
      pam = {
        enableSudoTouchIdAuth = true;
      };
    };

    stylix = {
      enable = true;
      image = ./desktop.png;
      base16Scheme = "${pkgs.base16-schemes}/share/themes/everforest.yaml";
      fonts = {
        serif = {
          package = pkgs.monaspace;
          name = "Monaspace Xeon Var";
        };

        sansSerif = {
          package = pkgs.monaspace;
          name = "Monaspace Argon Var";
        };

        monospace = {
          package = pkgs.monaspace;
          name = "Monaspace Neon Var";
        };

        emoji = {
          package = pkgs.noto-fonts-emoji;
          name = "Noto Color Emoji";
        };
      };
    };

    fonts= {
      packages = [
        pkgs.monaspace
      ];
    };

    imports = [
      ./services/aerospace.nix
      ./services/postgresql.nix
    ];
    
    nixpkgs.hostPlatform = "aarch64-darwin";
    system.stateVersion = 4;
}
