{ ... }:

{
  programs.gh = {
    enable = true;

    settings = {
      version = 1;
      git_protocol = "ssh";
      prompt = "enabled";
      prefer_editor_prompt = "disabled";
    };

    gh-dash = {
      enable = true;
    };
  };
}
