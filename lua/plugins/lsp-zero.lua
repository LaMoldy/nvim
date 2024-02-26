return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
        { 'neovim/nvim-lspconfig' },
        {
            'williamboman/mason.nvim',
            build = function()
                pcall(vim.cmd, 'MasonUpdate')
            end,
        },
        { 'williamboman/mason-lspconfig.nvim' },

        -- Autocompletion
        { 'hrsh7th/nvim-cmp' },
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'L3MON4D3/LuaSnip' },
    },
    config = function()
        local lsp = require('lsp-zero')

        lsp.on_attach(function(client, bufnr)
            lsp.default_keymaps({ buffer = bufnr })
        end)

        require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
        require('lspconfig').gopls.setup({
            settings = {
                gopls = {
                    gofumpt = true,
                }
            }
        })

        require("mason").setup({
            ui = {
                border = "rounded"
            }
        })

        require("mason-lspconfig").setup({
            handlers = {
                lsp.default_setup,
            }
        })

        require("lspconfig.ui.windows").default_options.border = "rounded"
        vim.diagnostic.config({
            float = {
                border = "rounded"
            }
        })
    end
}
