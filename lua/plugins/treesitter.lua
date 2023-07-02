return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = true,
    event = { "BufReadPost", "BufNewFile" },
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
    opts = {
        highlight = { enable = true },
        indent = { enable = true, disable = { "python" } },
        context_commentstring = { enable = true, enable_autocmd = false },
        ensure_isntalled = {
            "bash",
            "c",
            "cpp",
            "csharp",
            "rust",
            "java",
            "go",
            "help",
            "html",
            "javascript",
            "json",
            "lua",
            "luadoc",
            "luap",
            "markdown",
            "mardown_inline",
            "python",
            "query",
            "regex",
            "tsx",
            "typescript",
            "vim",
            "yaml"
        },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "<C-space>",
                node_incremental = "<C-space>",
                scope_incremental = "<nop>",
                node_decremental = "<bs>"
            }
        }
    },
    config = function(_, opts)
        require('nvim-treesitter.install').compilers = { "clang" }
        require('nvim-treesitter.configs').setup(opts)
    end
}
