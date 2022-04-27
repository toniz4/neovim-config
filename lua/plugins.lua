local install_path = vim.fn.stdpath("data") .. "/site/pack/paq/opt/paq-nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.cmd("!git clone https://github.com/savq/paq-nvim " .. install_path)
end

paq = require("paq")

packages = {
	'savq/paq-nvim',     -- Let Paq manage itself

	'neovim/nvim-lspconfig',
	'tpope/vim-commentary',
	-- 'toniz4/consclose.nvim',
	'tpope/vim-endwise',
	'ap/vim-css-color',
	'toniz4/vim-stt',
	'justinmk/vim-dirvish',


	'neovim/nvim-lspconfig',

	'hrsh7th/nvim-cmp',
	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/vim-vsnip',
	'hrsh7th/vim-vsnip-integ',
	'hrsh7th/cmp-vsnip',
	'hrsh7th/cmp-buffer',
	'hrsh7th/cmp-path',
	'f3fora/cmp-spell',

	'rafamadriz/friendly-snippets',

	'TheNiteCoder/mountaineer.vim',
	'pradyungn/Mountain',

	'dstein64/vim-startuptime',

	'junegunn/goyo.vim',

	'salkin-mada/openscad.nvim',

	-- 'elixir-editors/vim-elixir',
	'sheerun/vim-polyglot',

	'ctrlpvim/ctrlp.vim',

	-- 'neovimhaskell/haskell-vim',
	'adigitoleo/vim-mellow',
	'boppyt/avalanche',
	'windwp/nvim-autopairs'
}

paq(packages)

local plugin_path = vim.fn.stdpath("data") .. "/site/pack/paqs/start/"

for _, p in pairs(packages) do
    local path = plugin_path .. p:gsub('.*/', '')

	if vim.fn.empty(vim.fn.glob(path)) > 0 then
		paq.install()
	end
end
