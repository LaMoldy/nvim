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
        "onsails/lspkind.nvim",
        "L3MON4D3/LuaSnip",
        "rafamadriz/friendly-snippets",
    },
    opts = function()
        local cmp = require("cmp")
        local lspkind = require("lspkind")
        return {
            completion = {
                completeopt = "menu,menuone,noinsert",
                winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
                col_offset = -3,
                side_padding = 0
            },
            formatting = {
                fields = { "kind", "abbr", "menu" },
                format = lspkind.cmp_format({
                    mode = "symbol_text",
                    maxwidth = 50,
                    ellipsis_char = "...",

                    before = function(entry, vim_item)
                        return vim_item
                    end
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
                { name = "luasnip" },
                { name = "buffer" },
                { name = "path" },
            }),
            experimental = {
                ghost_text = {
                    hl_group = "LspCodeLens",
                },
            },
        }
    end,
}
