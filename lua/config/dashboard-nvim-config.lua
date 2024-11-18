local dashboard = require("dashboard")

dashboard.setup({
	theme = "hyper",
	config = {
		week_header = {
			enable = false,
		},
		shortcut = {
			{ desc = "Recent Files", group = "DiagnosticHint", action = "Telescope oldfiles", key = "r" },
			{ desc = "Load Last Session", group = "Number", action = "SessionLoad", key = "s" },
			{ desc = "Find File", group = "Label", action = "Telescope find_files", key = "f" },
			{ desc = "New File", group = "DiagnosticHint", action = "enew", key = "n" },
			{ desc = "Bookmarks", group = "Constant", action = "Telescope marks", key = "b" },
		},
		project = {
			enable = true,
			limit = 5,
			icon = "󰏓 ",
			label = "Recent Projects",
			action = "Telescope find_files cwd=",
		},
		mru = {
			limit = 5,
			icon = " ",
			label = "Recent Files",
		},
		footer = {
			"Dashboard powered by dashboard-nvim",
		},
	},
	hide = {
		statusline = false,
		tabline = false,
		winbar = false,
	},
})

-- Custom ASCII art header
vim.g.dashboard_custom_header = {
	[[                               __                ]],
	[[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
	[[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
	[[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
	[[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
	[[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
}

-- Disable movement in dashboard
vim.api.nvim_create_autocmd("FileType", {
	pattern = "dashboard",
	group = vim.api.nvim_create_augroup("DashboardSettings", { clear = true }),
	callback = function()
		vim.opt_local.cursorline = false
		vim.opt_local.cursorcolumn = false
		vim.opt_local.number = false
		vim.opt_local.relativenumber = false
		vim.opt_local.signcolumn = "no"
		vim.opt_local.statusline = ""
		vim.keymap.set("n", "q", ":q<CR>", { buffer = true, silent = true })
	end,
})

-- Change to VCS root when opening files
vim.g.dashboard_change_to_vcs_root = true
