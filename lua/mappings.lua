require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local bufnr = vim.api.nvim_get_current_buf()

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<leader>crr", "<cmd> CargoRun <cr>", { desc = "Cargo Run" })
map("n", "<leader>crt", "<cmd> CargoRunTerm <cr>", { desc = "Cargo Run Term" })
map("n", "<leader>cb", "<cmd> CargoBuild <cr>", { desc = " Cargo Build" })
map("n", "<leader>ct", "<cmd> CargoTest <cr>", { desc = "Cargo Test" })

map("n", "<leader>a", function()
  vim.cmd.RustLsp "codeAction" -- supports rust-analyzer's grouping
  -- or vim.lsp.buf.codeAction() if you don't want grouping.
end, { silent = true, buffer = bufnr })

map(
  "n",
  "K", -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
  function()
    vim.cmd.RustLsp { "hover", "actions" }
  end,
  { silent = true, buffer = bufnr }
)

map("n", "ca", function()
  vim.lsp.buf.code_action()
end, { desc = "LSP Code Action" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
