{ config, pkgs, ... }:
{
  programs.neovim = {
    enable = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraPackages = with pkgs; [
      # Language Servers
      # python313Packages.python-lsp-server
      pyright
      lua-language-server
      nixd # Nix LSP

      # Formatters
      ruff
      stylua
      shfmt
      alejandra # Formater for .nix files

      # Other tools
      gdtoolkit_4 # Tools for GDScript
    ];
  };

  home.file.".config/nvim" = {
    source = ./nvim;
    recursive = true;
  };

  home.packages = with pkgs; [
    ripgrep
    lazygit
    fzf
    fd
  ];
}
