require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<leader>crr", "<cmd> CargoRun <cr>", { desc = "Cargo Run" })
map("n", "<leader>crt", "<cmd> CargoRunTerm <cr>", { desc = "Cargo Run Term" })
map("n", "<leader>cb", "<cmd> CargoBuild <cr>", { desc = " Cargo Build" })
map("n", "<leader>ct", "<cmd> CargoTest <cr>", { desc = "Cargo Test" })

map("n", "<leader>ca", function()
  require("actions-preview").code_actions()
end, {
  desc = "Code Actions (Preview)",
})

map("n", "<leader>ih", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Toggle inlay hints" })
