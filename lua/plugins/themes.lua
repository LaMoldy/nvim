return {
    {
        "folke/tokyonight.nvim",
        lazy = true,
        priority = 1000,
        opts = { style = "moon" },
        config = function()
            local ok, tokyonight = pcall(require, 'tokyonight')
            if (not ok) then return end

            tokyonight.setup({
                style = "storm",
                transparent = true,
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
                }
            })
            vim.cmd.colorscheme "tokyonight"
        end,
    },
    {
        'Mofiqul/dracula.nvim',
        lazy = true,
        priority = 1000,
        config = function()
            local dracula = require("dracula")
            dracula.setup({
              show_end_of_buffer = true,
              transparent_bg = false,
              lualine_bg_color = "#44475a",
              italic_comment = true
            })

            vim.cmd.colorscheme 'dracula'
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
    },
    {
        "lunarvim/darkplus.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd.colorscheme 'darkplus'
        end
    }
}
