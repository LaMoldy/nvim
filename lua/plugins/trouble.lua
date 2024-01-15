return {
    "folke/trouble.nvim",
    lazy = true,
    event = "BufEnter",
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    opts = {
        use_diagnostic_signs = true,
        multiline = true,
    }
}