return {
    "laytan/cloak.nvim",
    lazy = true,
    event = "BufEnter",
    config = function()
        local ok, cloak = pcall(require, "cloak")
        if (not ok) then return end
        cloak.setup({
            enabled = true,
            cloak_character = "*",
            highlight_group = "Comment",
            patterns = {
                {
                    file_pattern = {
                        ".env*"
                    },
                    cloak_pattern = "=.+"
                }
            }
        })
    end
}