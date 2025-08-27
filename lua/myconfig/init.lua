require("myconfig.lazy")
-- Set up plugins that require it
require("oil").setup()
-- Keybinds

vim.api.nvim_create_user_command("Format", function()
  require("conform").format()
end, {})

-- Options
local opt = vim.opt

opt.number = true 
opt.relativenumber = true
opt.signcolumn = yes
vim.cmd("colorscheme kanagawa")
