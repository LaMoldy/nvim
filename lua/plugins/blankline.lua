return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    lazy = true,
    event = "BufEnter",
    config = function ()
        local ok, blankline = pcall(require, "ibl")
        if (not ok) then return end

        local highlight = {
            "CursorColumn",
            "Whitespace"
        }

        blankline.setup {
            indent = {
                char = "│",
                tab_char = nil,
                priority = 1,
                smart_indent_cap = true,
                repeat_linebreak = true
            },
            whitespace = {
                remove_blankline_trail = false
            },
            scope = { enabled = false }
        }
    end
}