return {
    "hrsh7th/nvim-cmp",
    lazy = true,
    event = "InsertEnter",
    priority = 1000,
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "saadparwaiz1/cmp_luasnip",
        "L3MON4D3/LuaSnip",
        "onsails/lspkind.nvim",
        "rafamadriz/friendly-snippets",
    },
    opts = function()
        local cmp = require("cmp")
        local lspkind = require("lspkind")
        return {
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            formatting = {
                expandable_indicator = true,
                format = lspkind.cmp_format({
                    mode = "symbol_text",
                    maxwidth = 50,
                    ellipsis_char = "..."
                })
            },
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-<Space>>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                ["<S-CR>"] = cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = true,
                }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip", max_item_count = 3 },
                { name = "buffer",  max_item_count = 5 },
                { name = "path",    max_item_count = 3 },
            }),
            experimental = {
                ghost_text = true,
            },
        }
    end,
}
