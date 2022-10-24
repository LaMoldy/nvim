local ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if (not ok) then return end

treesitter.setup {
  ensure_installed = {
    'css',
    'html',
    'javascript',
    'json',
    'python',
    'rust',
    'tsx',
    'typescript',
  },
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