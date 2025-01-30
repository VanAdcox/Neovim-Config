vim.g.mapleader = " "
require("config.lazy")

-- Vim Bindings / Options
vim.wo.relativenumber = true



vim.api.nvim_set_keymap('n', '-', ':Oil parent<CR>', {noremap = true})
vim.opt.signcolumn="number"

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- plugin stuff
vim.cmd("colorscheme kanagawa")
require("mason").setup()
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
	-- Automatically format Go files with gofmt on save
	vim.api.nvim_create_autocmd("BufWritePre", {
	    pattern = "*.go",
	    callback = function()
		vim.lsp.buf.format({ async = false })
	    end,
	})
    end,
})

lspconfig.omnisharp.setup {
  cmd = { "omnisharp" }, -- Ensure this points to the correct omnisharp binary
  root_dir = lspconfig.util.root_pattern(".git", ".sln", ".csproj"),
  capabilities = vim.lsp.protocol.make_client_capabilities(),
  on_attach = function(client, bufnr)
    local opts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  end,
}


local cfg = {}  -- add your config here
require "lsp_signature".setup(cfg)

