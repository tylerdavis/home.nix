{ ... }:

{
  programs.kitty = {
    enable = true;
    shellIntegration = {
      enableZshIntegration = true;
    };

    darwinLaunchOptions = [
      "--single-instance"
    ];

    keybindings = {
      "kitty_mod+0" = "toggle_layout stack";
    };

    settings = {
      window_padding_width = "12 36 4 36";

      # Tab bar
      tab_bar_style = "slant";
      tab_bar_margin_width = "10.0";
      tab_bar_margin_height = "4.0 0";
      tab_bar_margin_color = "#343f44";
      tab_bar_edge = "bottom";
      
      # Layouts
      enabled_layouts = "tall:bias=50;full_size=1;mirrored=false";
      
      # Fonts
      font_family = "family='Monaspace Neon Var' style=Light";
      # font_family = "family='Monaspace Neon Var' style=Light features='+calt +ss07 +ss08 +ss02 +ss01 +ordn +ss09 +ss03 +ss04 +ss05 +ss06'";
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";

      font_size = "13.0";
      modify_font = "cell_height 170%";
      
      disable_ligatures = "cursor";
    };
  };
}
