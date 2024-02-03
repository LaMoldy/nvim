return {
    "MunifTanjim/eslint.nvim",
    dependencies = {
        "jose-elias-alvarez/null-ls.nvim"
    },
    lazy = true,
    event = "BufEnter",
    config = function()
        local ok_eslint, eslint = pcall(require, "eslint")
        if (not ok_eslint) then return end

        local ok_null, null = pcall(require, "null-ls")
        if (not ok_null) then return end

        null.setup()

        eslint.setup({
            bin = "eslint",
            code_actions = {
                enable = true,
                disable_rule_comment = {
                    enable = true,
                    location = "separate_line"
                }
            },
            diagnostics = {
                enable = true,
                report_unused_disable_directives = false,
                run_on = "type"
            }
        })
    end
}