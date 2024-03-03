return {
    'stevearc/conform.nvim',
    opts = {
        formatters_by_ft = {
            python = { "pylint" },
            php = { "easy-coding-standard" },
            go = { "gofumpt", "golines" },
            javascript = { "prettier" },
            css = { "prettier" },
            html = { "prettier" },
            json = { "prettier" },
        },
        format_on_save = {
            timeout_ms = 500,
            lsp_fallback = true
        }
    },
}
