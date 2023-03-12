return {
  "nvim-treesitter/nvim-treesitter",
  run = "TSUpdate",
  dependencies = {
    {
      "junegunn/fzf",
      run = "fzf#install"
    }
  },
  lazy = false,
  config = function()
    local ok, treesitter = pcall(require, 'nvim-treesitter.configs')
    if (not ok) then return end

    treesitter.setup {
      highlight = {
        enable = true,
        disable = {}
      },
      indent = {
        enable = true,
        disable = {}
      },
      autotag = {
        enable = true,
      }
    }


    require'nvim-treesitter.install'.compilers = { "clang" }

    local parser_config = require'nvim-treesitter.parsers'.get_parser_configs()
    parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
  end
}