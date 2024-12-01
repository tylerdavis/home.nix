{ pkgs, ... }: 

{
    environment.systemPackages = with pkgs; [
      vim
    ];

    services.nix-daemon.enable = true;

    nix = {
      package = pkgs.nix;
      settings = {
        experimental-features = "nix-command flakes";
      };
    };

   #  services.karabiner-elements.enable = true;
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
          name = "Monaspace Xenon Light";
        };

        sansSerif = {
          package = pkgs.dejavu_fonts;
          name = "Monaspace Argon Light";
        };

        monospace = {
          package = pkgs.monaspace;
          name = "Monaspace Argon Light";
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
      ./services/sketchybar.nix
    ];
    
    nixpkgs.hostPlatform = "aarch64-darwin";
    system.stateVersion = 4;
}
