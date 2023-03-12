return {
  "kyazdani42/nvim-web-devicons",
  lazy = true,
  config = function()
    local status, icons = pcall(require, "nvim-web-devicons")
    if (not status) then return end

    icons.setup {
      override = {},
      default = true
    }
  end
}