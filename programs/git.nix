{ config, pkgs, ... }:
{
  programs.git = {
    enable = true;
    aliases = {
      co = "checkout";
      st = "status";
      br = "branch";
    };
    diff-so-fancy = {
      enable = true;
    };
  };
}
