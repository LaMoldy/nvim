return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function ()
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

        vim.cmd[[colorscheme tokyonight]]
    end
}
