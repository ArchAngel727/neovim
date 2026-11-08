-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "catppuccin",

  hl_add = {
    RainbowDelimiterRed = { fg = "red" },
    RainbowDelimiterYellow = { fg = "yellow" },
    RainbowDelimiterBlue = { fg = "blue" },
    RainbowDelimiterOrange = { fg = "orange" },
    RainbowDelimiterGreen = { fg = "green" },
    RainbowDelimiterViolet = { fg = "purple" },
    RainbowDelimiterCyan = { fg = "cyan" },
  },
}

-- M.nvdash = { load_on_startup = true }
M.ui = {
  tabufline = {
    lazyload = false,
  },
}

return M
