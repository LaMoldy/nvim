-- Encoding Settings
vim.scriptencoding    = 'utf-8'
vim.opt.encoding      = 'utf-8'
vim.fileencoding      = 'utf-8'

-- Window Settings
vim.wo.number         = true
vim.opt.title         = true
vim.opt.scrolloff     = 10
vim.opt.cmdheight     = 1
vim.opt.laststatus    = 2
vim.opt.showcmd       = true
vim.opt.inccommand    = 'split'
vim.opt.wrap          = false
vim.opt.background    = 'dark'
vim.opt.cursorline    = true
vim.opt.termguicolors = true
vim.opt.winblend      = 0
vim.opt.wildoptions   = 'pum'
vim.opt.pumblend      = 0
vim.opt.pumheight     = 100
vim.wo.relativenumber = true
vim.opt.colorcolumn   = '120'

-- Editing Settings
vim.opt.autoindent    = true
vim.opt.breakindent   = true
vim.opt.expandtab     = true
vim.opt.smarttab      = true
vim.o.shiftwidth      = 4
vim.o.tabstop         = 4
vim.opt.ai            = true
vim.opt.si            = true

-- Search Settings
vim.opt.hlsearch      = true
vim.opt.ignorecase    = true
vim.opt.path:append { '**' }                     -- Searches subfolders
vim.opt.wildignore:append { '*/node_modules/*' } -- ignores node_modules folders

-- Misc Settings
vim.opt.backup = false
vim.opt.backspace = 'start,eol,indent'
vim.opt.formatoptions:append { 'r' }
vim.cmd("set noswapfile")
vim.cmd("let &t_SI = \"\\e[2 q\"")
vim.cmd("let &t_EI = \"\\e[2 q\"")
vim.opt.listchars = { eol = '↩', tab = "  " }

vim.opt.list = true

vim.opt.guicursor = "n-v-c-i:block-Cursor"
