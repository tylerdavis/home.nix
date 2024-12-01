{ config, pkgs, ... }:
{
  programs.eza = {
    enableZshIntegration = true;
    enable = true;
    extraOptions = [
      "--group-directories-first"
    ];
  };
}
