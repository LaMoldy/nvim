return {
    {
        "stevearc/dressing.nvim",
        lazy = true,
        init = function()
          ---@diagnostic disable-next-line: duplicate-set-field
          vim.ui.select = function(...)
            require("lazy").load({ plugins = { "dressing.nvim" } })
            return vim.ui.select(...)
          end
          ---@diagnostic disable-next-line: duplicate-set-field
          vim.ui.input = function(...)
            require("lazy").load({ plugins = { "dressing.nvim" } })
            return vim.ui.input(...)
          end
        end,
      },
      {
        "nvim-lualine/lualine.nvim",
        lazy = true,
        event = "VeryLazy",
        config = function()
          local ok, lualine = pcall(require, 'lualine')
          if (not ok) then return end

          lualine.setup {
            options = {
              icons_enabled = true,
              theme = 'auto',
              component_separators = { left = '', right = ''},
              section_separators = { left = '', right = ''},
              disabled_filetypes = {
                statusline = {},
                winbar = {},
              },
              ignore_focus = {},
              always_divide_middle = true,
              globalstatus = false,
              refresh = {
                statusline = 1000,
                tabline = 1000,
                winbar = 1000,
              }
            },
            sections = {
              lualine_a = {'mode'},
              lualine_b = {'branch'},
              lualine_c = {{
                'filename',
                file_status = true,
                path = 0
              }},
              lualine_x = {
                {'diagnostics', sources = { "nvim_diagnostic" }, symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' }},
                'encoding',
                'filetype'
              },
              lualine_y = {'progress'},
              lualine_z = {'location'}
            },
            inactive_sections = {
              lualine_a = {},
              lualine_b = {},
              lualine_c = {{
                'filename',
                file_status = true,
                path = 1
              }},
              lualine_x = {'location'},
              lualine_y = {},
              lualine_z = {}
            },
              tabline = {},
              winbar = {},
              inactive_winbar = {},
              extensions = {}
          }
        end,
      },
      {
        "lukas-reineke/indent-blankline.nvim",
        event = { "BufReadPost", "BufNewFile" },
        opts = {
          -- char = "▏",
          char = "│",
          filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy" },
          show_trailing_blankline_indent = false,
          show_current_context = false,
        },
      },
      -- active indent guide and indent text objects
  {
    "echasnovski/mini.indentscope",
    version = false, -- wait till new 0.7.0 release to put it back on semver
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      -- symbol = "▏",
      symbol = "│",
      options = { try_as_border = true },
    },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
    config = function(_, opts)
      require("mini.indentscope").setup(opts)
    end,
  },

  -- noicer ui
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
        },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
      },
    },
    -- stylua: ignore
    keys = {
      { "<S-Enter>", function() require("noice").redirect(vim.fn.getcmdline()) end, mode = "c", desc = "Redirect Cmdline" },
      { "<leader>snl", function() require("noice").cmd("last") end, desc = "Noice Last Message" },
      { "<leader>snh", function() require("noice").cmd("history") end, desc = "Noice History" },
      { "<leader>sna", function() require("noice").cmd("all") end, desc = "Noice All" },
      { "<c-f>", function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end, silent = true, expr = true, desc = "Scroll forward", mode = {"i", "n", "s"} },
      { "<c-b>", function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end, silent = true, expr = true, desc = "Scroll backward", mode = {"i", "n", "s"}},
    },
  },
  -- icons
  { "nvim-tree/nvim-web-devicons", lazy = true },

  -- ui components
  { "MunifTanjim/nui.nvim", lazy = true },
}