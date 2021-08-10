-- local execute = vim.api.nvim_command
-- local fn = vim.fn

-- local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

-- if fn.empty(fn.glob(install_path)) > 0 then
-- 	execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
-- 	execute 'packadd packer.nvim'
-- end

-- -- Only required if you have packer in your `opt` pack
-- vim.cmd [[packadd packer.nvim]]

-- return require('packer').startup(function()
-- 	-- Packer can manage itself as an optional plugin
-- 	use {'wbthomason/packer.nvim', opt = true}

-- 	use {'tpope/vim-commentary'}
-- 	use {
-- 		'toniz4/consclose.nvim',
-- 		requires = {
-- 			'tpope/vim-endwise'
-- 		},
-- 		config = function()
-- 			vim.g.consclose_no_mappings = 0
-- 			vim.g.endwise_no_mappings = 0
-- 		end
-- 	}

-- 	use {'ap/vim-css-color'}

-- 	use {'tpope/vim-fugitive'}

-- 	use 'https://github.com/aditya-azad/candle-grey'
-- 	use 'https://github.com/swalladge/antarctic-vim'

-- 	use {'gentoo/gentoo-syntax'}

-- 	use{
-- 		'neovim/nvim-lspconfig',
-- 		requires = {
-- 			'nvim-lua/lsp-status.nvim',
-- 			'hrsh7th/nvim-compe',
-- 			'hrsh7th/vim-vsnip',
-- 			'hrsh7th/vim-vsnip-integ',
-- 		},
-- 		config = function() require("modules.lsp") end
-- 	}

-- 	use {'toniz4/vim-stt'}

-- 	use {'/justinmk/vim-dirvish'}

-- 	use {'https://github.com/dstein64/vim-startuptime'}

-- end)

local install_path = vim.fn.stdpath("data") .. "/site/pack/paq/opt/paq-nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.cmd("!git clone https://github.com/savq/paq-nvim " .. install_path)
end

vim.cmd 'packadd paq-nvim'         -- Load package
local paq = require'paq-nvim'.paq  -- Import module and bind `paq` function
paq{'savq/paq-nvim', opt=true}     -- Let Paq manage itself

paq 'neovim/nvim-lspconfig'
paq 'tpope/vim-commentary'
paq 'toniz4/consclose.nvim'
paq 'tpope/vim-endwise'
paq 'ap/vim-css-color'
paq 'gentoo/gentoo-syntax'

paq 'neovim/nvim-lspconfig'
paq 'nvim-lua/lsp-status.nvim'
paq 'hrsh7th/nvim-compe'
paq 'hrsh7th/vim-vsnip'
paq 'hrsh7th/vim-vsnip-integ'
paq 'toniz4/vim-stt'
paq 'justinmk/vim-dirvish'
paq 'golang/vscode-go'

paq 'TheNiteCoder/mountaineer.vim'
paq 'pradyungn/Mountain'

paq 'dstein64/vim-startuptime'

paq 'junegunn/goyo.vim'
