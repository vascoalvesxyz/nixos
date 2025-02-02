-- This file can be loaded by calling `lua require('plugins')` from your init.vim
--
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
      'nvim-telescope/telescope.nvim', tag = '0.1.2',
      requires = { {'nvim-lua/plenary.nvim'} }
  }

    use ( 'skammer/vim-css-color')

    use({
	    "L3MON4D3/LuaSnip",
	    tag = "v2.*",
	    run = "make install_jsregexp"
    })

    use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use ('nvim-treesitter/playground')
    use ('theprimeagen/harpoon')
    use ('mbbill/undotree')
    use ('tpope/vim-fugitive')
    use ( 'junegunn/goyo.vim' )
    use ('vim-airline/vim-airline')
    use ('vim-airline/vim-airline-themes')
    use ('ianding1/leetcode.vim')

	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{'williamboman/mason.nvim'},           -- Optional
			{'williamboman/mason-lspconfig.nvim'}, -- Optional

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},     -- Required
			{'hrsh7th/cmp-nvim-lsp'}, -- Required
			{'L3MON4D3/LuaSnip'},     -- Required
		}
	}

    use ( 'norcalli/nvim-colorizer.lua' )

  end)

