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

-- Lsp Saga
map('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', { noremap = true, silent = true })
map('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', { noremap = true, silent = true })
map('n', 'gd', '<Cmd>Lspsaga lsp_finder<CR>', { noremap = true, silent = true })
map('n', '<leader>ca', '<Cmd>Lspsaga code_action<CR>', { noremap = true, silent = true })
map('n', 'gp', '<Cmd>Lspsaga peek_definition<CR>', { noremap = true, silent = true })
map('n', 'gr', '<Cmd>Lspsaga rename<CR>', { noremap = true, silent = true })

-- Harpoon
map('n', 'hm', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', { noremap = true, silent = true })
map('n', 'ha', ':lua require("harpoon.mark").add_file()<CR>', { noremap = true, silent = false })
map('n', 'hn', ':lua require("harpoon.ui").nav_next()<CR>', { noremap = true, silent = true })
map('n', 'hp', ':lua require("harpoon.ui").nav_prev()<CR>', { noremap = true, silent = true })
map('n', 'ht', '<Cmd>Telescope harpoon marks<CR>', { noremap = true, silent = true })

-- Telescope
map('n', '<leader>fg', '<CMD>lua require("telescope.builtin").git_files{}<CR>', { noremap = true })
map('n', '<leader>ff', '<CMD>lua require("telescope.builtin").find_files{ hidden = true }<CR>', { noremap = true })

-- Fugitive
map('n', '<leader>gh', '<Cmd>Git<CR>', { noremap = true, silent = true })
map('n', '<leader>gp', '<Cmd>Git push<CR>', { noremap = true, silent = true })

-- Neotree
map('n', '<leader>tt', ':Neotree toggle<CR>', { noremap = true, silent = true })
