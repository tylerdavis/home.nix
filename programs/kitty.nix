{ ... }:

{
  programs.kitty = {
    enable = true;
    shellIntegration = {
      enableZshIntegration = true;
    };
    settings = {
      tab_bar_style = "powerline";
      tab_bar_margin_width = "10.0";
      tab_bar_margin_height = "4.0 4.0";
      tab_bar_edge = "top";
      modify_font = "cell_height +3px";
    };
  };
}
