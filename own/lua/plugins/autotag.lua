return {
  "windwp/nvim-ts-autotag",
  lazy = true,
  event = "InsertEnter",
  config = function()
    local ok, autotags = pcall(require, 'nvim-ts-autatag')
    if (not ok) then return end
    autotags.setup()
  end
}