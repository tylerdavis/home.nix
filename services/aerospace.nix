{ config, pkgs, ... }:
{
  services.aerospace = {
    settings = {
      accordion-padding = 0;
      gaps = {
        outer.left = 4;
        outer.bottom = 4;
        outer.top = 4;
        outer.right = 4;
      };
      mode.main.binding = {
        alt-h = "focus left";
        alt-j = "focus down";
        alt-k = "focus up";
        alt-l = "focus right";
      };
    };
  };
}
