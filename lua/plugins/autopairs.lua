return {
    'windwp/nvim-autopairs',
    lazy = true,
    event = "InsertEnter",
    dependencies = {
        "windwp/nvim-ts-autotag"
    },
    config = function()
        local ok, autopairs = pcall(require, "nvim-autopairs")
        if (not ok) then return end

        autopairs.setup({
            check_ts = true,
            ts_config = {
                javascript = { "template_string" }
            }
        })

        local cmp_autopairs_ok, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
        if (not cmp_autopairs_ok) then return end

        local cmp_ok, cmp = pcall(require, "cmp")
        if (not cmp_ok) then return end

        cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

        local ts_auto_ok, ts_autopairs = pcall(require, "nvim-ts-autotag")
        if (not ts_auto_ok) then return end

        ts_autopairs.setup()
    end
}