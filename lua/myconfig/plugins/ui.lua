return {
  { "nvim-lualine/lualine.nvim", opts = { options = { theme = "auto" } } },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
}

