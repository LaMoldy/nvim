return {
  "folke/zen-mode.nvim",
  lazy = true,
  event = "InsertLeave",
  config = function()
    local status, zenMode = pcall(require, "zen-mode")
    if (not status) then return end

    zenMode.setup {}
  end
}