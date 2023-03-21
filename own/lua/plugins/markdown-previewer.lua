return {
  "iamcco/markdown-preview.nvim",
  lazy = true,
  event = "InsertLeave",
  run = function()
    vim.fn["mkdp#util#install"]()
  end
}