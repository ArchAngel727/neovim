require("nvchad.configs.lspconfig").defaults()

vim.lsp.config("basedpyright", require("configs.basedpyright").config)

vim.lsp.enable "basedpyright"

vim.lsp.enable "clangd"

vim.lsp.enable "kmonad-vim"

vim.lsp.enable "gopls"

vim.lsp.config("html", {
  cmd = { "vscode-html-language-server", "--stdio" },
  init_options = {
    configurationSection = { "html", "css", "javascript" },
    embeddedLanguages = {
      css = true,
      javascript = true,
    },
    provideFormatter = true,
  },
  root_markers = { "package.json", ".git" },
})

vim.lsp.enable "html"

vim.lsp.config("cssls", {
  cmd = { "vscode-css-language-server", "--stdio" },
  filetypes = { "css", "scss", "less" },
  init_options = {
    provideFormatter = true,
  },
  settings = {
    css = {
      validate = true,
    },
    less = {
      validate = true,
    },
    scss = {
      validate = true,
    },
  },
})

vim.lsp.enable "cssls"

vim.lsp.config("tsserver", {
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "javascript", "typescript" },
})

vim.lsp.enable "tsserver"

vim.lsp.config("tombi", {
  cmd = { "tombi", "lsp" },
  filetypes = { "toml" },
  root_markers = { "tombi.toml", "pyproject.toml", ".git" },
})

vim.lsp.enable "tombi"
