return {
  "windwp/nvim-autopairs",
  lazy = true,
  event = "InsertEnter",
  config = function()
    local ok, autopairs = pcall(require, 'nvim-autopairs')
    if (not ok) then return end
    autopairs.setup{}
  end
}