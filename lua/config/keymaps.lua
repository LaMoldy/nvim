local map = vim.api.nvim_set_keymap

-- Map Leader
vim.g.mapleader = " "

-- Changing Windows
map('n', '<leader>k', '<C-w>k', { noremap = true }) -- Move up
map('n', '<leader>j', '<C-w>j', { noremap = true }) -- Move down
map('n', '<leader>l', '<C-w>l', { noremap = true }) -- Move to left
map('n', '<leader>h', '<C-w>h', { noremap = true }) -- Move to right

-- Resizing windows
map('n', '<C-w><Left>', '<C-w><', { noremap = true })
map('n', '<C-w><Right>', '<C-w>>', { noremap = true })
map('n', '<C-w><Up>', '<C-w>+', { noremap = true })
map('n', '<C-w><Down>', '<C-w>-', { noremap = true })

-- Changing Tabs
map('n', '<Left>', ':tabprevious<CR>', { noremap = true, silent = true })
map('n', '<Right>', ':tabnext<CR>', { noremap = true, silent = true })

-- Spliting windows
map('n', 'sh', ':split<Return><C-w>w', { noremap = true, silent = true })
map('n', 'sv', ':vsplit<Return><C-w>w', { noremap = true, silent = true })

-- Text Keybinds
map('n', '<C-a>', 'gg<S-v>G', { noremap = true }) -- Selects all text
map('n', '+', '<C-a>', { noremap = true })
map('n', '-', '<C-x>', { noremap = true })

-- Neo Tree
map('n', '<leader>tt', ':Neotree toggle<CR>', { noremap = true })
-- map('n', '<leader>pv', ':NERDTreeFind<CR>', { noremap = true, silent = true })

-- Float term
map('n', '<leader>lg', '<CMD>FloatermNew --autoclose=2 --height=0.9 --width=0.9 lazygit<CR>', { noremap = true })
map('n', '<leader>rd', '<CMD>FloatermNew --autoclose=2 --height=0.9 --width=0.9 yarn dev<CR>', { noremap = true })
map('n', '<leader>rb', '<CMD>FloatermNew --autoclose=2 --height=0.9 --width=0.9 yarn build<CR>', { noremap = true })

-- Telescope
map('n', '<leader>fg', '<CMD>lua require("telescope.builtin").git_files{}<CR>', { noremap = true })
map('n', '<leader>ff', '<CMD>lua require("telescope.builtin").find_files{ hidden = true }<CR>', { noremap = true })

-- Lsp Saga
map('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', { noremap = true, silent = true })
map('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', { noremap = true, silent = true })
map('n', 'gd', '<Cmd>Lspsaga lsp_finder<CR>', { noremap = true, silent = true })
map('n', '<leader>ca', '<Cmd>Lspsaga code_action<CR>', { noremap = true, silent = true })
map('n', 'gp', '<Cmd>Lspsaga peek_definition<CR>', { noremap = true, silent = true })
map('n', 'gr', '<Cmd>Lspsaga rename<CR>', { noremap = true, silent = true })

-- zenmode:
map('n', '<C-w>o', '<cmd>ZenMode<cr>', { silent = true })

-- bufferline
map('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {})
map('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})

-- Prettier
map('n', '<Leader>fd', ':lua vim.lsp.buf.formatting()<CR>', { noremap = true, silent = true })