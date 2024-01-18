return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
    "nvim-telescope/telescope.nvim",
    "ibhagwan/fzf-lua",
  },
  config = function()
    local ok, neogit = pcall(require, "neogit")
    if (not ok) then return end

    neogit.setup {
      auto_show_console = false
    }
  end
}
