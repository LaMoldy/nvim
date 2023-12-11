return {
    {
        "craftzdog/solarized-osaka.nvim",
        lazy = true,
        priority = 1000,
        config = function()
            local ok, solarized_osaka = pcall(require, "solarized-osaka")
            if (not ok) then return end

            solarized_osaka.setup({
                transparent = false,
            })

            vim.cmd.colorscheme "solarized-osaka"
        end
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = { style = "storm" },
        config = function()
            local ok, tokyonight = pcall(require, 'tokyonight')
            if (not ok) then return end

            tokyonight.setup({
                style = "night",
                transparent = false,
                terminal_colors = true,
                styles = {
                    comments = "italic",
                    keywords = "NONE",
                    functions = "NONE",
                    variablers = "NONE",
                    sidebars = "transparent",
                    floats = "transparent"
                },
                sidebars = {
                    "qf",
                    "vista_kind",
                    "terminal",
                    "packer"
                },
            })
            vim.cmd.colorscheme "tokyonight"
        end,
    },
    {
        'rose-pine/neovim',
        name = "rose-pine",
        lazy = true,
        priority = 1000,
        config = function()
            require('rose-pine').setup({
                variant = 'moon',
                disable_background = true,
                disable_italics = true
            })
            vim.cmd.colorscheme "rose-pine"
        end
    },
    {
        'navarasu/onedark.nvim',
        lazy = true,
        priority = 1000,
        config = function()
            require('onedark').setup {
                term_colors = true,
                transparent = false,
                ending_tildes = true,
                lualine = {
                    transparent = false
                },
                diagnostics = {
                    darker = true,
                    undercurl = false,
                    background = true
                },
                code_style = {
                    comments = 'italic',
                    keywords = 'none',
                    functions = 'none',
                    strings = 'none',
                    variables = 'none'
                }
            }

            vim.cmd.colorscheme 'onedark'
        end,
    }
}
