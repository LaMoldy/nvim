-- return {
--     "catppuccin/nvim",
--     lazy = false,
--     priority = 1000,
--     opts = {
--         integrations = {
--             cmp = true,
--             gitsigns = true,
--             harpoon = true,
--             illuminate = true,
--             indent_blankline = {
--                 enabled = false,
--                 scope_color = "sapphire",
--                 colored_indent_levels = false,
--             },
--             mason = true,
--             native_lsp = { enabled = true },
--             notify = true,
--             nvimtree = true,
--             neotree = true,
--             symbols_outline = true,
--             telescope = true,
--             treesitter = true,
--             treesitter_context = true,
--         },
--     },
--     config = function()
--         for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
--             vim.api.nvim_set_hl(0, group, {})
--         end
--         vim.cmd("colorscheme catppuccin-frappe")
--     end
-- }

return {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("onedark").setup {
            style = 'warmer',
            term_colors = true,
            ending_tildes = false,
            code_style = {
                comments = 'none',
                keywords = 'none',
                functions = 'none',
                strings = 'none',
                variables = 'none',
            },
            colors = {},
            highlights = {},
            diagnostics = {
                darker = true,
                undercurl = true,
                background = true,
            },
        }

        vim.cmd("colorscheme onedark")
    end
}
