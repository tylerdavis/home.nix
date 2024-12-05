{ pkgs, lib, ... }:
let
fromGitHub = rev: ref: repo: pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "${lib.strings.sanitizeDerivationName repo}";
    version = ref;
    src = builtins.fetchGit {
      url = "https://github.com/${repo}.git";
      ref = ref;
      rev = rev;
    };
  };
in

{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    coc = {
      enable = true;
    };
    plugins = with pkgs.vimPlugins; [
      nvim-lspconfig
      nvim-treesitter.withAllGrammars
      mini-nvim
      telescope-nvim
      telescope-file-browser-nvim
      telescope-fzf-native-nvim
      # (fromGitHub "HEAD" "elihunter173/dirbuf.nvim")
    ];

    extraLuaConfig = builtins.readFile ./init.lua;
  };
}
