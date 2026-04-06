local M = {}

M.config = {
  filetypes = { "python" },
  on_attach = M.on_attach,
  settings = {
    basedpyright = {
      analysis = {
        typeCheckingMode = "off",
        ignore = { "*" },
      },
      disableOrganizeImports = true,
    },
  },
}

return M
