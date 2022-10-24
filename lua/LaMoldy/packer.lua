local ok, packer = pcall(require, 'packer')
if (not ok) then
    print('packer is not installed')
    return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
    use 'wbthomason/packer.nvim' -- Packer
    use 'lukas-reineke/indent-blankline.nvim' -- Indent Lines
    use 'nvim-lualine/lualine.nvim' -- Status Line
    use 'folke/tokyonight.nvim' -- Tokyonight Theme
    use 'luisiacc/gruvbox-baby' -- Gruvbox Theme
    use 'catppuccin/nvim' -- Catppuccin Theme
    use 'arcticicestudio/nord-vim'
    use 'preservim/nerdtree' -- File Exploreer Sidebar
    use 'voldikss/vim-floaterm' -- Float term
    use 'windwp/nvim-autopairs' -- Auto pairs
    use 'windwp/nvim-ts-autotag' -- Auto tags
    use { 'nvim-treesitter/nvim-treesitter', run = 'TSUpdate' } -- Treesitter
    use { 'junegunn/fzf', run = 'fzf#install' } -- Fuzzy Finder
    use 'nvim-telescope/telescope.nvim' -- Telescope
    use 'nvim-telescope/telescope-file-browser.nvim' -- Telescope
    use 'nvim-lua/popup.nvim' -- Popups
    use 'nvim-lua/plenary.nvim' -- Plenary
    use 'folke/lsp-colors.nvim' -- LSP Colours
    -- use { 'glepnir/lspsaga.nvim', branch = 'main' }
    use 'williamboman/mason.nvim' -- Lsp insaller
    use 'williamboman/mason-lspconfig.nvim' -- Lsp installer
    use 'jose-elias-alvarez/null-ls.nvim' -- Formatter
    use 'onsails/lspkind-nvim' -- Lsp symbols
    use 'L3MON4D3/LuaSnip' -- Lua snip
    use 'hrsh7th/cmp-buffer' -- Buffer completion
    use 'hrsh7th/cmp-nvim-lsp' -- Nvim source for LSP
    use 'hrsh7th/nvim-cmp' -- Completion
    use 'neovim/nvim-lspconfig' -- LSP
    use 'kyazdani42/nvim-web-devicons' -- File icons
    use 'folke/zen-mode.nvim' -- Zen mode
    use 'akinsho/nvim-bufferline.lua'
    use 'MunifTanjim/prettier.nvim'
    use({
      "iamcco/markdown-preview.nvim",
      run = function() vim.fn["mkdp#util#install"]() end,
    })
end)