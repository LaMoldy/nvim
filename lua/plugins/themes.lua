return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
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
    }
}
