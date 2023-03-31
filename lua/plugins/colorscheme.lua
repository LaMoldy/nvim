return {
  {
    "folke/tokyonight.nvim",
    lazy = true,
    priority = 1000,
    opts = { style = "moon" },
    config = function()
      local ok, tokyonight = pcall(require, 'tokyonight')
      if (not ok) then return end

      tokyonight.setup({
        style = "storm",
        transparent = true,
        terminal_colors = true,
        styles = {
            comments = "italic",
            keywords = "NONE",
            functions = "NONE",
            variablers = "NONE",
            sidebars = "transparent",
            floats = "transparent"
        },
        sidebars = {
            "qf",
            "vista_kind",
            "terminal",
            "packer"
        }
      })
      vim.cmd("colorscheme tokyonight")
    end,
  },
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    config = function()
      vim.cmd("colorscheme catppuccin")
    end
  },
  {
    "savq/melange-nvim",
    lazy = false,
    config = function()
      vim.cmd("colorscheme melange")
    end
  },
  {
    "svrana/neosolarized.nvim",
    dependencies = {
      "tjdevries/colorbuddy.nvim"
    },
    lazy = true,
    priority = 1000,
    config = function ()

      local status, neosolarized = pcall(require, 'neosolarized')
      if (not status) then return end

      neosolarized.setup({
        comment_italics =  true,
        background_set = false
      })

      local Color, colors, Group, groups, styles = require('colorbuddy').setup()

      Color.new('black', '#000000')
      Group.new('CursorLine', colors.none, colors.base03, styles.NONE, colors.base1)
      Group.new('CursorLineNr', colors.yellow, colors.black, styles.NONE, colors.base1)
      Group.new('Visual', colors.none, colors.base03, styles.reverse)

      local cError = groups.Error.fg
      local cInfo = groups.Information.fg
      local cWarn = groups.Warning.fg
      local cHint = groups.Hint.fg

      Group.new("DiagnosticVirtualTextError", cError, cError:dark():dark():dark():dark(), styles.NONE)
      Group.new("DiagnosticVirtualTextInfo", cInfo, cInfo:dark():dark():dark(), styles.NONE)
      Group.new("DiagnosticVirtualTextWarn", cWarn, cWarn:dark():dark():dark(), styles.NONE)
      Group.new("DiagnosticVirtualTextHint", cHint, cHint:dark():dark():dark(), styles.NONE)
      Group.new("DiagnosticUnderlineError", colors.none, colors.none, styles.undercurl, cError)
      Group.new("DiagnosticUnderlineWarn", colors.none, colors.none, styles.undercurl, cWarn)
      Group.new("DiagnosticUnderlineInfo", colors.none, colors.none, styles.undercurl, cInfo)
      Group.new("DiagnosticUnderlineHint", colors.none, colors.none, styles.undercurl, cHint)

      vim.cmd("colorscheme neosolarized")
    end
  },
  {

  },
}