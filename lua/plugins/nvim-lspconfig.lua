return {
	-- nvim-lspconfig plugin
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim", -- For managing LSP installations
			"williamboman/mason-lspconfig.nvim", -- For configuring LSP servers with Mason
		},
		config = function()
			require("mason").setup() -- Initialize Mason
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "gopls" }, -- Add your desired language servers here
			})

			local lspconfig = require("lspconfig")

			-- Example configuration for Lua language server
			lspconfig.lua_ls.setup({
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" }, -- Recognize 'vim' as a global variable
						},
					},
				},
			})

			-- Add more server configurations as needed
		end,
		event = { "BufReadPost", "BufNewFile" }, -- Load when opening files
	},
}
