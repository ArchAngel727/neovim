require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- NOTE: Move selection up or down
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- NOTE: Keep cursor in place when moving lines up
map("n", "J", "mzJ`z")

-- NOTE: Keep cursor in the middle when doing half page jump
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- NOTE: Keep cursor in the middle when jumping between results
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

map("n", "Q", "<nop>")

map("x", "<leader>p", '"_dP')

-- NOTE: Code actions menu
map("n", "<leader>ca", function()
  require("actions-preview").code_actions()
end, {
  desc = "Code Actions (Preview)",
})

-- NOTE: Rename word under cursor in buffer
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- NOTE: Toggle inline hints
map("n", "<leader>ih", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Toggle inlay hints" })

map("n", "<leader>nh", function()
  Snacks.notifier.show_history()
end, { desc = "Notification history" })

map("n", "<leader>nd", function()
  Snacks.notifier.hide()
end, { desc = "Dismiss notifications" })
