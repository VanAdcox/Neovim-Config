return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	config = function()
		require("dashboard").setup({
			theme = "hyper",
			config = {
				week_header = { enable = false },
				packages = { enable = true },
				footer = { " " },
				packages = { enable = true },
				week_header = { enable = true },
			},
			shortcut = {
				{ desc = "Recent Files", group = "DiagnosticHint", action = "Telescope oldfiles", key = "r" },
				{ desc = "Load Last Session", group = "Number", action = "SessionLoad", key = "s" },
				{ desc = "Find File", group = "Label", action = "Telescope find_files", key = "f" },
				{ desc = "New File", group = "DiagnosticHint", action = "enew", key = "n" },
				{ desc = "Bookmarks", group = "Constant", action = "Telescope marks", key = "b" },
			},
		})
	end,
	dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
