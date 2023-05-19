return {
{
    "folke/tokyonight.nvim",
    lazy = false,
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
    priority = 1000,
    config = function()
      local ok, catppuccin = pcall(require, 'catppuccin')
      if (not ok) then return end

      catppuccin.setup({
        flavour = "macchiato",
        transparent_background = true,
        term_colors = true,
        no_italic = true,
      })
      vim.cmd("colorscheme catppuccin")
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
    "Mofiqul/dracula.nvim",
    lazy = true,
    priority = 1000,
    config = function ()
      require('dracula').setup({
        transparent_bg = true,
        italic_comment = false,
      })
      vim.cmd("colorscheme dracula")
    end
  },

  {
    "navarasu/onedark.nvim",
    lazy = true,
    priority = 1000,
    config = function()
      require("onedark").setup {
        style = "darker",
        transparent = true,
        term_colors = true,
        ending_tildes = true,
        code_style = {
          comments = 'none',
          keywords = 'none',
          functions = 'none',
          strings = 'none',
          variables = 'none'
        },
        lualine = {
          transparent = true
        },
        diagnostics = {
          darker = true,
          undercurl = true,
          background = true
        }
      }
      require("onedark").load()
    end
  },

  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    lazy = true,
    config = function()
      require("gruvbox").setup({
        undercurl = true,
        underline = true,
        bold = false,
        italic = {
          strings = false,
          comments = false,
          operators = false,
          folds = false,
        },
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        invert_intend_guides = false,
        inverse = true,
        contrast = "soft",
        palette_overrides = {},
        overrides = {},
        dim_inactive = false,
        transparent_mode = true,
      })
      vim.cmd("colorscheme gruvbox")
    end
  },

  {
    "rose-pine/neovim",
    lazy = true,
    priority = 1000,
    config = function ()
      require("rose-pine").setup({
        variant = "moon",
        dark_variant = "moon",
        disable_background = true,
        disable_float_background = true,
        disable_italics = true
      })

      vim.cmd("colorscheme rose-pine")
    end
  }
}