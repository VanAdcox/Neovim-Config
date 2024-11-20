return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	config = function()
		require("dashboard").setup({
			theme = "hyper",
			config = {
				footer = { "come mr tally man" },
				packages = { enable = true },
				week_header = { enable = true },
				shortcut = {
						{ desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
						{ desc = " Find File", group = "Label", action = "Telescope find_files", key = "f" },
						{ desc = "󰑓 Recent Files", group = "DiagnosticHint", action = "Telescope oldfiles", key = "r" },
						{ desc = " New File", group = 'DashboardShortCutIcon', action = "enew", key = "n" },
				},
			},
		})
	end,
	dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
