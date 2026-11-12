{pkgs, ...}: {
  home.packages = with pkgs; [
    # lsp servers, formatters, linters
    efm-langserver # formatter and linter thing for neovim
    selene # lua lint
    stylua # lua fmt
    lua-language-server # lua lsp
    alejandra # nix fmt
    nil # nix lsp
    ruff # python lint & fmt
    pyright # python lsp
    svelte-language-server # svelte lsp
    qt6.qtdeclarative # qml lsp
    prettier # markdown fmt (and others)
    marksman # markdown lsp
    sql-formatter # sql fmt
    sqls # sql lsp
  ];
}
