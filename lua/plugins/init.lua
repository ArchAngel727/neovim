return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require "configs.conform",
  },

  {
    import = "nvchad.blink.lazyspec",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = require "configs.mason",
  },

  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
  },

  {
    "nvim-mini/mini.nvim",
    version = "*",
    init = function()
      require("mini.icons").setup()
    end,
  },

  {
    "mrcjkb/rustaceanvim",
    filetypes = { "rust" },
    ft = { "rust" },
    lazy = false,
    version = "^9",
  },

  {
    "saecki/crates.nvim",
    ft = { "toml" },
    event = { "BufRead Cargo.toml" },
    config = function()
      require("crates").setup()
    end,
  },

  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },

  {
    "nwiizo/cargo.nvim",
    build = "cargo build --release",
    config = function()
      require("cargo").setup {
        float_window = true,
        window_width = 0.8,
        window_height = 0.8,
        border = "rounded",
        auto_close = true,
        close_timeout = 5000,
      }
    end,
    ft = { "rust" },
    cmd = {
      "CargoBench",
      "CargoBuild",
      "CargoClean",
      "CargoDoc",
      "CargoNew",
      "CargoRun",
      "CargoRunTerm",
      "CargoTest",
      "CargoUpdate",
      "CargoCheck",
      "CargoClippy",
      "CargoAdd",
      "CargoRemove",
      "CargoFmt",
      "CargoFix",
    },
  },

  {
    "DetachHead/basedpyright",
  },

  {
    "kmonad/kmonad-vim",
  },

  {
    "MunifTanjim/prettier.nvim",
  },

  -- {
  --   "ray-x/go.nvim",
  --   dependencies = { -- optional packages
  --     "ray-x/guihua.lua",
  --     "neovim/nvim-lspconfig",
  --     "nvim-treesitter/nvim-treesitter",
  --   },
  --   opts = function()
  --     -- require("go").setup(opts)
  --     local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
  --     vim.api.nvim_create_autocmd("BufWritePre", {
  --       pattern = "*.go",
  --       callback = function()
  --         require("go.format").goimports()
  --       end,
  --       group = format_sync_grp,
  --     })
  --     return {
  --       -- lsp_keymaps = false,
  --       -- other options
  --     }
  --   end,
  --   event = { "CmdlineEnter" },
  --   ft = { "go", "gomod" },
  --   build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  -- },

  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "python",
        "rust",
        "html",
        "css",
        "javascript",
        "typescript",
      },
    },
  },

  {
    "selimacerbas/live-server.nvim",
    dependencies = {
      "folke/which-key.nvim",
      "nvim-telescope/telescope.nvim", -- recommended for path picker
    },
    init = function()
      -- which-key group label only (best practice)
      local ok, wk = pcall(require, "which-key")
      if ok then
        wk.add { { "<leader>l", group = "LiveServer" } }
      end
    end,
    opts = require("configs.live-server").opts,
    keys = require("configs.live-server").keys,
    config = function(_, opts)
      require("live_server").setup(opts)
    end,
  },

  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = require "configs.trouble",
  },

  {
    "tombi-toml/tombi",
    filetypes = { "toml" },
    root_markers = { "tombi.toml", "pyproject.toml", ".git" },
  },
}
