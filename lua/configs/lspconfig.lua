require("nvchad.configs.lspconfig").defaults()

-- vim.lsp.config("basedpyright", {
--   filetypes = { "python" },
--   settings = {
--     basedpyright = {
--       analysis = {
--         typeCheckingMode = "off",
--         ignore = { "*" },
--       },
--       disableOrganizeImports = true,
--     },
--   },
-- })

vim.lsp.config("basedpyright", require("configs.basedpyright").config)

-- require("configs.basedpyright").setup()

vim.lsp.enable "basedpyright"

vim.lsp.config("clangd", {
  config = {
    cmd = {
      "clangd",
      "--Werror",
    },
  },
})

vim.lsp.enable "clangd"

vim.lsp.enable "kmonad-vim"

vim.lsp.enable "gopls"

vim.lsp.config("tsserver", {
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "javascript", "typescript" },
})

vim.lsp.enable "tsserver"

vim.lsp.config("tombi", {
  filetypes = { "toml" },
  root_markers = { "tombi.toml", "pyproject.toml", ".git" },
})

vim.lsp.enable "tombi"
