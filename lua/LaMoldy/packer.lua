local cmd = vim.api.nvim_command
local fn = vim.fn
local packer = nil

local function packer_verify()
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
        cmd 'packadd packer.nvim'
    end
end

local function packer_startup()
    if packer == nil then
        packer = require'packer'
        packer.init()
    end

    local use = packer.use
    packer.reset()

    -- Packer
    use 'wbthomason/packer.nvim'

    -- Themes
    use {
        'folke/tokyonight.nvim',
        config = function ()
            require'LaMoldy.plugins.tokyonight'.init()
        end
    }

    -- Fuzzy Finder
    use { 
        'junegunn/fzf', 
        run = function() 
            vim.fn['fzf#install']() 
        end 
    }

    -- Plenary
    use 'nvim-lua/plenary.nvim'

    -- File explorer
    use 'scrooloose/nerdtree'

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = 'TSUpdate',
        config = function ()
            require'LaMoldy.plugins.treesitter'.init()
        end
    }


    -- Telescope
    use 'nvim-lua/popup.nvim'
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            'windwp/nvim-ts-autotag'
        },
        config = function ()
            require'LaMoldy.plugins.telescope'.init()
        end
    }

    -- Language Servers
    use {
        'lspcontainers/lspcontainers.nvim',
        requires = {
        'neovim/nvim-lspconfig',
        'nvim-lua/lsp_extensions.nvim',
        },
        config = function ()
        require'lspcontainers'.setup({
            ensure_installed = {
            "html",
            "pylsp",
            "rust_analyzer",
            "sumneko_lua",
            "tsserver",
            }
        })

        require'LaMoldy.plugins.lspconfig'.init()
        end
    }
    use 'williamboman/nvim-lsp-installer'

    -- completion plugins
    use {
        'hrsh7th/nvim-cmp', -- Completion plugin
        requires = {
            'hrsh7th/cmp-nvim-lsp',
            'onsails/lspkind-nvim',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-vsnip',
            'hrsh7th/vim-vsnip',
            'ray-x/cmp-treesitter',
        },
        config = function ()
            require 'LaMoldy.plugins.cmp'.init()
            require 'LaMoldy.plugins.lspkind'.init()
        end
    }

    use {
        'folke/lsp-colors.nvim',
        config = function()
          require("lsp-colors").setup()
        end
      }
    
      use {
        'voldikss/vim-floaterm',
        config = function ()
          require'LaMoldy.plugins.floaterm'.init()
        end
      }
end

local function init()
    packer_verify()
    packer_startup()
end

return {
    init = init,
}