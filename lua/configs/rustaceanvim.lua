vim.g.rustaceanvim = function()
  local bufnr_maps = function(bufnr)
    local opts = { buffer = bufnr, silent = true, noremap = true }

    vim.keymap.set("n", "K", function()
      vim.cmd.RustLsp { "hover", "actions" }
    end, vim.tbl_extend("force", opts, { desc = "Rust hover actions" }))

    vim.keymap.set("n", "<leader>ca", function()
      vim.cmd.RustLsp { "codeAction" }
    end, vim.tbl_extend("force", opts, { desc = "Rust code actions" }))

    vim.keymap.set("n", "<leader>cr", function()
      vim.cmd.RustLsp { "runnables" }
    end, vim.tbl_extend("force", opts, { desc = "Rust runnables" }))

    vim.keymap.set("n", "<leader>cm", function()
      vim.cmd.RustLsp { "expandMacro" }
    end, vim.tbl_extend("force", opts, { desc = "Rust expand macro" }))

    vim.keymap.set("n", "<leader>ce", function()
      vim.cmd.RustLsp { "explainError" }
    end, vim.tbl_extend("force", opts, { desc = "Rust explain error" }))

    vim.keymap.set("n", "<leader>cC", function()
      vim.cmd.RustLsp { "openCargo" }
    end, vim.tbl_extend("force", opts, { desc = "Rust open Crates.toml" }))
  end

  return {
    server = {
      on_attach = function(_, bufnr)
        bufnr_maps(bufnr)
      end,
    },
  }
end
