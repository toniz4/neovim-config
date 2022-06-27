
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function()
	use 'wbthomason/packer.nvim'

	-- Quality of life:
	use 'tpope/vim-commentary'
	use 'tpope/vim-endwise'
	use 'ap/vim-css-color'
	use 'toniz4/vim-stt'
	use 'dstein64/vim-startuptime'
	use 'junegunn/goyo.vim'
	use 'jiangmiao/auto-pairs'

	-- Files
	use 'ctrlpvim/ctrlp.vim'
	use 'justinmk/vim-dirvish'

	-- Lsp stuff
	-- use {
	-- 	'neovim/nvim-lspconfig',
	-- 	requires = {
	-- 		'hrsh7th/nvim-cmp',

	-- 		'hrsh7th/cmp-nvim-lsp',
	-- 		'hrsh7th/vim-vsnip',
	-- 		'hrsh7th/vim-vsnip-integ',
	-- 		'hrsh7th/cmp-vsnip',
	-- 		'hrsh7th/cmp-buffer',
	-- 		'hrsh7th/cmp-path',
	-- 		'f3fora/cmp-spell',
	-- 		'rafamadriz/friendly-snippets'
	-- 	},
	-- 	config = function()
	-- 		require("modules.lsp")
	-- 	end,
	-- 	event = 'InsertEnter *'
	-- }
	-- Lsp 
	use 'neovim/nvim-lspconfig'

	use {
		'hrsh7th/nvim-cmp',
		requires = {
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/vim-vsnip',
			'hrsh7th/vim-vsnip-integ',
			'hrsh7th/cmp-vsnip',
			{'hrsh7th/cmp-buffer', after = 'nvim-cmp'},
			{'hrsh7th/cmp-path', after = 'nvim-cmp'},
			'f3fora/cmp-spell'
		},
		config = [[require("modules.lsp")]]
	}


	use 'rafamadriz/friendly-snippets'

	use {
		"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  		config = function()
			require("lsp_lines").register_lsp_virtual_lines()
			vim.diagnostic.config {
  				virtual_text = false
			}
  		end
	}

	-- use {
  		-- "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
	-- 	config = function()
	-- 		require("lsp_lines").register_lsp_virtual_lines()
  		-- end
	-- }
	-- Programing languages
	use 'sheerun/vim-polyglot'
	-- Clojure
	use 'Olical/conjure'

	-- Themes:
	use 'TheNiteCoder/mountaineer.vim'
	use 'pradyungn/Mountain'
	use 'adigitoleo/vim-mellow'
  	use 'boppyt/avalanche'

	if packer_bootstrap then
		require('packer').sync()
  	end
end)

