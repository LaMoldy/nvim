return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = { "nvim-lua/plenary.nvim" },
        lazy = true,
        event = { "BufEnter", "BufLeave" },
        config = function()
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
            vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = 'Telescope git files' })
            vim.keymap.set('n', '<leader>gf', builtin.live_grep, { desc = 'Telescope live grep' })
            vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })


            require("telescope").load_extension("harpoon")
            require("telescope").setup {
                defaults = {
                    file_ignore_patterns = {
                        "node_modules",
                        "build",
                        ".git",
                        ".sl",
                        "target",
                        "vendor",
                        "venv",
                        "dist",
                        "__pycache__",
                        ".pytest_cache"
                    },
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
