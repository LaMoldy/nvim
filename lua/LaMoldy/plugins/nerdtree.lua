local function init()
    local map = vim.api.nvim_set_keymap
    local option1 = { noremap = true }
    local option2 = { noremap = true, silent = true }

    map('n', '<leader>;;', ':NERDTreeToggle<CR>', option1)
    map('n', '<leader>pv', ':NERDTreeFind<CR>', optoin2 )
end

return {
    init = init
}