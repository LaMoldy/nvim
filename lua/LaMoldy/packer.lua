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
        config = function ()
            require'LaMoldy.plugins.telescope'.init()
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