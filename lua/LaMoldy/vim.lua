local function set_augroup()
   -- vim.api.nvim_command("autocmd BufWritePre * %s/\s\+$//e")
end

local function set_vim_g()
    vim.g.mapleader = " "
end

local function set_vim_o()
    local settings = {
        softtabstop = 4,
        errorbells = false,
        smartindent = true,
        backup = false,
        incsearch = true,
        scrolloff = 8,
        background = 'dark',
        colorcolumn = '80',
    }

    -- Generic Vim.o
    for k, v in pairs(settings) do
        vim.o[k] = v
    end

    -- Note yet in vim.o
    vim.cmd('set encoding=utf8')
    vim.cmd('set nowritebackup')
    vim.cmd('set shiftwidth=2')
    vim.cmd('set secure')
    vim.cmd('set tabstop=4')
    vim.cmd('syntax on')
    vim.cmd('set noswapfile')
    vim.cmd('set signcolumn')
    vim.cmd('set nomodeline')
end

local function set_vim_wo()
    vim.wo.number = true
    vim.wo.relativenumber = true
    vim.wo.wrap = false
    vim.wo.t_Co='256'
end

local function set_keymaps()
    local map = vim.api.nvim_set_keymap
    local option1 = { noremap = false } 
    local option2 = { noremap = true }
    local option3 = { noremap = true, silent = true }
    local option4 = { silent = true }

    -- Changing tabs
    map('n', '<leader>h', '<CMD>wincmd h<CR>', option1)
    map('n', '<leader>j', '<CMD>wincmd j<CR>', option1)
    map('n', '<leader>k', '<CMD>wincmd k<CR>', option1)
    map('n', '<leader>l', '<CMD>wincmd l<CR>', option1)

    -- Changes zoom
    map('n', '<leader>vr', 'vertical resize 30<CR>', option4)
    map('n', '<leader>r+', ':vertical resize +5<CR>', option4)
    map('n', '<leader>r-', ':vertical resize -5<CR>', option4)

    -- NERD TREE
    map('n', '<leader>tt', ':NERDTreeToggle<CR>', option2)
    map('n', '<leader>pv', ':NERDTreeFind<CR>', option3)
end

local function init()
    set_augroup()
    set_vim_g()
    set_vim_o()
    set_vim_wo()
    set_keymaps()
end

return {
    init = init
}