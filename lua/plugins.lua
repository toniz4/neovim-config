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

	-- Simple plugins can be specified as strings
	-- use {'jiangmiao/auto-pairs'}

	use {'tpope/vim-vinegar'}
	use {'tpope/vim-commentary'}

	use {'ap/vim-css-color'}

	-- use {
	-- 	'ajgrf/parchment',
	-- 	config = function() vim.cmd("colorscheme parchment") end
	-- }
	use {
		'toniz4/canus.nvim',
		config = function() vim.cmd("colorscheme canus") end
	}
	-- use {
	-- 	'igungor/schellar',
	-- 	config = function() vim.cmd("colorscheme schellar") end
	-- }

	use {'gentoo/gentoo-syntax'}

	use{
		'neovim/nvim-lspconfig',
		requires = {
			'hrsh7th/nvim-compe',
			'hrsh7th/vim-vsnip',
			'norcalli/snippets.nvim'
		},
		config = function() require("modules.lsp") end
	}

	use {
		'toniz4/vim-stt'}

	use {
		'neovimhaskell/haskell-vim',
		config = function()
			local vars =  {
				haskell_indent_if = 3,
				haskell_indent_case = 2,
				haskell_indent_let = 4,
				haskell_indent_where = 6,
				haskell_indent_before_where = 2,
				haskell_indent_after_bare_where = 2,
				haskell_indent_do = 3,
				haskell_indent_in = 1,
				haskell_indent_guard = 2
			}
			for k, v in pairs(vars) do
				vim.g[k] = v
			end
		end
	}
end)
