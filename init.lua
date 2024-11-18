require("config.lazy")
require("options") -- the docs say not to manually require this but it wont work if i dont :shrug:


-- plugin stuff
require("mason").setup()
require("oil").setup()
require("lspconfig").gopls.setup({
	cmd = { "gopls" },
	filetypes = { "go" },
	root_dir = require("lspconfig").util.root_pattern("go.mod", ".git"),
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
		},
	},
})
local cmp = require('cmp')

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)  -- For LuaSnip users.
        end,
    },
    mapping = {
        ['<C-k>'] = cmp.mapping.select_prev_item(),  -- Navigate to previous item
        ['<C-j>'] = cmp.mapping.select_next_item(),  -- Navigate to next item
        ['<C-Space>'] = cmp.mapping.complete(),        -- Trigger completion
        ['<C-e>'] = cmp.mapping.close(),               -- Close completion menu
        ['<CR>'] = cmp.mapping.confirm({ select = true }),  -- Confirm selection
    },
    sources = {
        { name = 'nvim_lsp' },  -- LSP completions
        { name = 'luasnip' },    -- Snippet completions
        { name = 'buffer' },     -- Buffer completions
        { name = 'path' },       -- Path completions
    },
})

local lspconfig = require('lspconfig')

lspconfig.gopls.setup({
    on_attach = function(client, bufnr)
        -- Enable signature help on CursorHold and CursorHoldI events
        vim.api.nvim_create_autocmd({"CursorHold", "CursorHoldI"}, {
            buffer = bufnr,
            callback = function()
                vim.lsp.buf.signature_help()
            end,
        })
    end,
})


local cfg = {}  -- add your config here
require "lsp_signature".setup(cfg)

