return {
  -- File tree on side of screen
  {
    "nvim-tree/nvim-tree.lua",
    lazy = true,
    event = { "BufEnter", "BufLeave" },
    config = function()
      require("nvim-tree").setup({
        sort_by = "case_sensitive",
        view = {
          width = 30
        },
        renderer = {
          group_empty = true
        },
        filters = {
          dotfiles = true
        }
      })
    end
  },

  -- File search
  {
    "nvim-telescope/telescope.nvim", tag = "0.1.1",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = true,
    event = { "BufEnter", "BufLeave" },
    config = function()
      require("telescope").load_extension("harpoon")
      require("telescope").setup {
        defaults = {
          file_ignore_patterns = {
            "node_modules",
            "build",
            ".git",
            ".sl",
            "target"
          }
        },
      }
    end
  }
}