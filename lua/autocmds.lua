require "nvchad.autocmds"

vim.filetype.add {
  pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
}

-- Inline hints
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client:supports_method "textDocument/inlayHint" then
      vim.lsp.inlay_hint.enable(false, { bufnr = args.buf })
    end
  end,
})

vim.filetype.add {
  extension = { tera = "html" },
  pattern = { [".*%.html%.tera"] = "html" },
}

local view_group = vim.api.nvim_create_augroup("AutoView", { clear = true })

local function is_real_file(buf)
  return vim.bo[buf].buftype == "" and vim.api.nvim_buf_get_name(buf) ~= ""
end

vim.api.nvim_create_autocmd({ "BufWinLeave", "BufWritePost" }, {
  group = view_group,
  callback = function(args)
    if is_real_file(args.buf) then
      vim.cmd "silent! mkview"
    end
  end,
})

vim.api.nvim_create_autocmd("BufWinEnter", {
  group = view_group,
  callback = function(args)
    if is_real_file(args.buf) then
      vim.cmd "silent! loadview"
    end
  end,
})
