require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<leader>crr", "<cmd> CargoRun <cr>", { desc = "Cargo Run" })
map("n", "<leader>crt", "<cmd> CargoRunTerm <cr>", { desc = "Cargo Run Term" })
map("n", "<leader>cb", "<cmd> CargoBuild <cr>", { desc = " Cargo Build" })
map("n", "<leader>ct", "<cmd> CargoTest <cr>", { desc = "Cargo Test" })

map("n", "ca", function()
  vim.lsp.buf.code_action()
end, { desc = "LSP Code Action" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
