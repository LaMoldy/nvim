return {
  "folke/lsp-colors.nvim",
  lazy = false,
  config = function()
    local ok, lspcolors = pcall(require, 'lsp-colors')
    if (not ok) then return end
    lspcolors.setup()
  end
}