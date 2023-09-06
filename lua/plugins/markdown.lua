return {
    "iamcco/markdown-preview.nvim",
    lazy = true,
    event = { "BufEnter", "BufLeave" },
    config = function() vim.fn["mkdp#util#install"]() end,
}