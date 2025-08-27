return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "williamboman/mason.nvim", config = true },
      { "williamboman/mason-lspconfig.nvim" },
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup {
        ensure_installed = { "gopls", "pyright", "clangd" },
      }

      local lspconfig = require("lspconfig")
      local on_attach = function(_, bufnr)
        local map = vim.keymap.set
        map("n", "K", vim.lsp.buf.hover, { buffer = bufnr })
        map("n", "gd", vim.lsp.buf.definition, { buffer = bufnr })
        -- Add more mappings as needed
      end

      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      for _, server in ipairs({ "gopls", "pyright", "clangd" }) do
        lspconfig[server].setup({
          on_attach = on_attach,
          capabilities = capabilities,
        })
      end
    end,
  },
}

