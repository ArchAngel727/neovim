require "nvchad.autocmds"

vim.filetype.add {
  pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
}

-- Hyprlang LSP
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = { "*.hl", "hypr*.conf" },
  callback = function(_)
    vim.lsp.start {
      name = "hyprlang",
      cmd = { "hyprls" },
      root_dir = vim.fn.getcwd(),
      settings = {
        hyprls = {
          preferIgnoreFile = true, -- set to false to prefer `hyprls.ignore`
          ignore = { "hyprlock.conf", "hypridle.conf" },
        },
      },
    }
  end,
})
