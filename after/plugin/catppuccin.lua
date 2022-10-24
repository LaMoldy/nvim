local ok, catppuccin = pcall(require, 'catppuccin')
if (not ok) then return end

local colors = require("catppuccin.palettes").get_palette()
colors.dark_blue = "#2F2F5B"

catppuccin.setup({
  transparent_background = true,
  term_colors = true,
  styles = {
      comments = { "italic" },
      conditionals = {},
      loops = {},
      functions = {},
      keywords = {},
      strings = {},
      variables = {},
      numbers = {},
      booleans = {},
      properties = {},
      types = {},
      operators = {}
  },
  integrations = {
      cmp = true,
      lsp_saga = true,
      treesitter = true,
      telescope = true,
  },
  custom_highlights = {
    CursorLine = { bg = colors.dark_blue }
  }
})

vim.g.catppuccin_flavour = "frappe"
-- vim.cmd [[colorscheme catppuccin]]