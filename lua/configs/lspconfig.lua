require("nvchad.configs.lspconfig").defaults()

vim.lsp.enable {
  "clangd",
  "basedpyright",
  "css-lsp",
  "emmet_language_server",
  "gopls",
  "html-lsp",
  "hyprls",
  "lua-ls",
  "kmonad-vim",
  "tombi",
  "rustaceanvim",
  "tsserver",
}

vim.lsp.inlay_hint.enable(true)
