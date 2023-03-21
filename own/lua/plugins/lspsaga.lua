return {
  "glepnir/lspsaga.nvim",
  branch = "main",
  lazy = true,
  event = "InsertLeave",
  config = function()
    local status, saga = pcall(require, "lspsaga")
    if (not status) then return end
    saga.setup({})
  end
}