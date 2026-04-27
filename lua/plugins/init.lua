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
    ft = { "rust" },
    version = "^9",
  },

  {
    "saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    config = function()
      require("crates").setup()
    end,
  },

  {
    require "configs.cargo",
  },

  {
    "kmonad/kmonad-vim",
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
        "hyprland",
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

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      require("lazy").load { plugins = { "markdown-preview.nvim" } }
      vim.fn["mkdp#util#install"]()
    end,
  },

  {
    require "configs.nvim-dap",
  },

  {
    require "configs.telescope-ui-select",
  },

  {
    require "configs.snacks",
  },
}
