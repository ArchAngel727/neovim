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
    require "configs.cargo",
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
    require "configs.live-server",
  },

  {
    require "configs.trouble",
  },

  {
    "tombi-toml/tombi",
    filetypes = { "toml" },
    root_markers = { "tombi.toml", "pyproject.toml", ".git" },
  },

  {
    "nvim-svelte/nvim-svelte-check",
    config = function()
      require("svelte-check").setup {
        command = "bun run check",
      }
    end,
  },

  {
    "aznhe21/actions-preview.nvim",
    config = function()
      require("actions-preview").setup {
        diff = { ctxlen = 3 },
        backend = { "telescope", "nui" }, -- uses Telescope for fuzzy preview
      }
    end,
  },
}
