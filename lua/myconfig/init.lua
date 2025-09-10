-- Keybinds
vim.api.nvim_create_user_command("Format", function()
  require("conform").format()
end, {})

vim.g.mapleader = " "

-- Options
local opt = vim.opt

opt.number = true 
opt.relativenumber = true
opt.signcolumn = yes
-- Set up plugins
require("myconfig.lazy")
vim.cmd("colorscheme kanagawa")
require("oil").setup()

