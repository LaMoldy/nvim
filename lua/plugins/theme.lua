return {
    {
        "folke/tokyonight.nvim",
        lazy = true,
        priority = 1000,
        opts = {},
        config = function()
            local ok, tokyonight = pcall(require, "tokyonight")

            if (not ok) then return end
            tokyonight.setup({
                style = "storm",
                transparent = true,
                terminal_colors = true,
                styles = {
                    comments = {
                        italic = false
                    },
                    keywords = {
                        italic = false
                    },
                    functions = {
                        italic = false
                    },
                    variables = {
                        italic = false
                    },
                    sidebars = "transparent",
                    floats = "transparent"
                }
            })

            vim.cmd("colorscheme tokyonight")
        end
    },
    {
        "catppuccin/nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                integrations = {
                    cmp = true,
                    gitsigns = true,
                    harpoon = true,
                    illuminate = true,
                    indent_blankline = {
                        enabled = false,
                        scope_color = "sapphire",
                        colored_indent_levels = false,
                    },
                    mason = true,
                    native_lsp = { enabled = true },
                    notify = true,
                    nvimtree = true,
                    neotree = true,
                    symbols_outline = true,
                    telescope = true,
                    treesitter = true,
                    treesitter_context = true,
                },
            })

            vim.cmd.colorscheme("catppuccin-macchiato")

            -- Hide all semantic highlights until upstream issues are resolved (https://github.com/catppuccin/nvim/issues/480)
            for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
                vim.api.nvim_set_hl(0, group, {})
            end
        end,
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        lazy = true,
        priority = 1000,
        config = function()
            local ok, rosepine = pcall(require, "rose-pine")

            if (not ok) then return end
            rosepine.setup({
                variant = "moon",
                dark_variant = "moon",
                dim_inactive_windows = false,
                extend_background_behind_borders = true,

                enable = {
                    terminal = true,
                    legacy_highlights = true,
                    migrations = true,
                },

                styles = {
                    bold = false,
                    italic = false,
                    transparency = false,
                },
            })
            vim.cmd("colorscheme rose-pine")
        end
    }
}
