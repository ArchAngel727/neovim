require "nvchad.options"

-- add yours here!

local o = vim.o
o.cursorlineopt = "both" -- to enable cursorline!

o.foldenable = true
o.viewoptions = "folds"
o.foldlevelstart = 99

local opt = vim.opt

opt.nu = true
opt.relativenumber = true

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

opt.smartindent = true

opt.swapfile = false
opt.backup = false

opt.hlsearch = false
opt.incsearch = true

opt.updatetime = 250

opt.termguicolors = true
