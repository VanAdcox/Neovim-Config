return {
  { "nvim-lualine/lualine.nvim", opts = { options = { theme = "auto" } } },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
  {
    "stevearc/oil.nvim",
    opts = {
      default_file_explorer = true,
      view_options = {
        show_hidden = true,
      },
    },
    keys = {
      { "-", "<CMD>Oil<CR>", desc = "Open Oil (parent dir)" },
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
}

