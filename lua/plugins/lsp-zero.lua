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
        local lsp = require('lsp-zero').preset({})

        lsp.on_attach(function(client, bufnr)
            lsp.default_keymaps({ buffer = bufnr })
        end)

        require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

        lsp.setup()

        local cmp = require('cmp')
        local cmp_action = require('lsp-zero').cmp_action()
    end
}
