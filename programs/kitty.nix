{ ... }:

{
  programs.kitty = {
    enable = true;
    shellIntegration = {
      enableZshIntegration = true;
    };
    settings = {
      window_padding_width = "6";

      # Tab bar
      tab_bar_style = "slant";
      tab_bar_margin_width = "10.0";
      tab_bar_margin_height = "4.0 0";
      tab_bar_margin_color = "#343f44";
      tab_bar_edge = "bottom";
      
      
      # Fonts
      font_family = "MonaspaceNeon";
      bold_font = "MonaspaceNeonBold";
      italic_font = "MonaspaceNeonItalic";
      bold_italic_font = "MonaspaceNeonBoldItalic";

      font_size = "13.0";
      modify_font = "cell_height 130%";

      font_features = ''
        MonaspaceNeon +ss01 +ss02 +ss03 +ss04 +ss05 +calt +liga
        MonaspaceNeonBold +ss01 +ss02 +ss03 +ss04 +ss05 +calt +liga
        MonaspaceNeonItalic +ss01 +ss02 +ss03 +ss04 +ss05 +calt +liga
        MonaspaceNeonBoldItalic +ss01 +ss02 +ss03 +ss04 +ss05 +calt +liga
      '';

      disable_ligatures = "cursor";

      box_drawing_scale = "0.001, 1, 1.5, 2";
    };
  };
}
