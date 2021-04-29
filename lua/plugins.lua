local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
	execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
	execute 'packadd packer.nvim'
end

-- Only required if you have packer in your `opt` pack
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
	-- Packer can manage itself as an optional plugin
	use {'wbthomason/packer.nvim', opt = true}

	use {'tpope/vim-commentary'}
	use {
		'toniz4/consclose.nvim',
		requires = {
			'tpope/vim-endwise'
		},
		config = function()
			vim.g.consclose_no_mappings = 0
			vim.g.endwise_no_mappings = 0
		end
	}

	use {'ap/vim-css-color'}

	use {'tpope/vim-fugitive'}

	use 'https://github.com/aditya-azad/candle-grey'
	use 'https://github.com/swalladge/antarctic-vim'

	use {'gentoo/gentoo-syntax'}

	use{
		'neovim/nvim-lspconfig',
		requires = {
			'nvim-lua/lsp-status.nvim',
			'hrsh7th/nvim-compe',
			'hrsh7th/vim-vsnip',
			'hrsh7th/vim-vsnip-integ',
		},
		config = function() require("modules.lsp") end
	}

	use {'toniz4/vim-stt'}

	use {'/justinmk/vim-dirvish'}

	use {'https://github.com/dstein64/vim-startuptime'}

end)
