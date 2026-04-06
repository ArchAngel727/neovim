local conform = require "conform"

conform.formatters.stylua = {
  prepend_args = {
    "--indent-type",
    "Spaces",
    "--indent-width",
    "2",
  },
}

local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
