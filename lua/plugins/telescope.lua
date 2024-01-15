return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = { "nvim-lua/plenary.nvim" },
        lazy = true,
        event = { "BufEnter", "BufLeave" },
        config = function()
            require("telescope").load_extension("harpoon")
            require("telescope").setup {
                defaults = {
                    file_ignore_patterns = {
                        "node_modules",
                        "build",
                        ".git",
                        ".sl",
                        "target"
                    }
                },
            }
        end
    },
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
            return vim.fn.executable 'make' == 1
        end,
    },
}
