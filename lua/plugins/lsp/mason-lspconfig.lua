return {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    config = function()
	require("mason-lspconfig").setup()
    end,
}
