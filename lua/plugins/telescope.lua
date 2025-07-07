return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
     dependencies = { 
	     'nvim-lua/plenary.nvim',
	     { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
     },
     config = function()
	     local telescope = require("telescope")
	     local actions = require("telescope.actions")

	     telescope.setup({
	      defaults = {
		path_display = { "smart" },
		mappings = {
		  i = {
		    ["<C-k>"] = actions.move_selection_previous, -- move to prev result
		    ["<C-j>"] = actions.move_selection_next, -- move to next result
		  },
		},
	      },
	    })
	    telescope.load_extension("fzf");

	    telescope.setup({
	      defaults = {
		path_display = { "smart" },
		mappings = {
		  i = {
		    ["<C-k>"] = actions.move_selection_previous, -- move to prev result
		    ["<C-j>"] = actions.move_selection_next, -- move to next result
		  },
		},
	      },
	    })

     end
}
