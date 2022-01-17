local install_path = vim.fn.stdpath("data") .. "/site/pack/paq/opt/paq-nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.cmd("!git clone https://github.com/savq/paq-nvim " .. install_path)
end

require "paq" {
	'savq/paq-nvim';     -- Let Paq manage itself

	'neovim/nvim-lspconfig';
	'tpope/vim-commentary';
	'toniz4/consclose.nvim';
	'tpope/vim-endwise';
	'ap/vim-css-color';
	'toniz4/vim-stt';
	'justinmk/vim-dirvish';


	'neovim/nvim-lspconfig';
	'hrsh7th/nvim-cmp';
	'hrsh7th/cmp-nvim-lsp';
	'hrsh7th/vim-vsnip';
	'hrsh7th/vim-vsnip-integ';
	'hrsh7th/cmp-vsnip';
	'hrsh7th/cmp-buffer';
	'hrsh7th/cmp-path';
	'f3fora/cmp-spell';
	'rafamadriz/friendly-snippets';

	'TheNiteCoder/mountaineer.vim';
	'pradyungn/Mountain';

	'dstein64/vim-startuptime';

	'junegunn/goyo.vim';

	'salkin-mada/openscad.nvim';
}
