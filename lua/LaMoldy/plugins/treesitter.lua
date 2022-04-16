local function init()
require 'nvim-treesitter.install'.compilers = { "clang" }
require'nvim-treesitter.configs'.setup{
    ensure_installed = {
        'css',
        'html',
        'javascript',
        'json',
        'python',
        'rust',
        'tsx',
        'typescript',
    },
    highlight = {
        enable = true
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
        },
    },
    indent = {
        enable = true
    }
}

require('nvim-ts-autotag').setup({
    filetypes = { "html" , "xml", "jsx", "tsx", "js" },
})
--vim.cmd[[set foldmethod=expr]]
--vim.cmd[[set foldexpr=nvim_treesitter#foldexpr()]]
end

return {
    init = init
}