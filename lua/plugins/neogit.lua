return {
    'NeogitOrg/neogit',
    dependencies = 'nvim-lua/plenary.nvim',
    config = function()
        require('neogit').setup {
            auto_show_console = false,
            console_timeout = 2000
        }
    end
}
