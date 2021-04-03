require("plugins")

local function setopts()
	local globalOpts = {
		backup = false,
		cindent = true,
		completeopt = "menuone,noinsert,noselect",
		-- enc = "utf-8",	
		errorbells = false,
		hidden = true,
		ignorecase = true,
		inccommand = "split",
		incsearch = true,
		laststatus = 2,
		mouse = vim.o.mouse .. "a",
		scrolloff = 2,
		shortmess = vim.o.shortmess .. "c",
		showmode = false,
		smartcase = true,
		synmaxcol = 200,
		termguicolors = true,
		timeoutlen = 500,
		writebackup = false,
		background = "light",
		completeopt = "menu,menuone,noselect",
		title = true,

		tabstop = 4,
		shiftwidth = 4,
	}

	local bufferOpts = {
		tabstop = 4,
		shiftwidth = 4,
	}

	local windowOpts = {
		signcolumn = "number",
		number = true,
		relativenumber = true,
	}
	
	for k, v in pairs(globalOpts) do
	    vim.o[k] = v
	end

	for k, v in pairs(bufferOpts) do
	    vim.bo[k] = v
	end

	for k, v in pairs(windowOpts) do
	    vim.wo[k] = v
	end
end

vim.o.clipboard = vim.o.clipboard .. "unnamedplus"

local function setvars()
	local globalVars = {
		loaded_netrw = 1,
		loaded_netrwPlugin = 1,
		netrw_banner = 0,
		netrw_liststyle = 3,
		netrw_altv = 1,
		netrw_winsize = 25,
		netrw_usetab = 0,
		stt_auto_insert = 1,
		stt_auto_quit = 1,
		closer_dont_map = 1,

		haskell_indent_if = 4,
		haskell_indent_case = 8,
		haskell_indent_let = 4,
		haskell_indent_where = 6,
		haskell_indent_before_where = 2,
		haskell_indent_after_bare_where = 8,
		haskell_indent_do = 2,
		haskell_indent_in = 1,
		haskell_indent_guard = 2,
		haskell_classic_highlighting = 0,
	}

	for k, v in pairs(globalVars) do
	    vim.g[k] = v
	end
end

vim.g.mapleader = " "

local opts = {noremap = true, silent = true}
local mappings = {
	-- Buffer list
	{"n", "<leader>bo", ":buffers<CR>:buffer<space>", opts},
	-- dirvish
	{"n", "<leader>fm", ":Dirvish<CR>", opts},
	-- Fix Y
	{"n", "Y", "y$", {noremap = false}},
	-- Move within splits with alt+{h,j,k,l}
	{"n", "<C-h>", "<C-w>h", opts},
	{"n", "<C-j>", "<C-w>j", opts},
	{"n", "<C-k>", "<C-w>k", opts},
	{"n", "<C-l>", "<C-w>l", opts},
	-- Disable highlight with leader l
	{"n", "<leader>l", ":nohlsearch<CR>", opts},
	-- Terminal keybinds
	{"n", "<F2>",      ":ToggleTerm<CR>", opts},
	{"n", "<leader>t", ":ToggleTerm<CR>", opts},
	{"t", "<F2>", "<C-\\><C-n>:ToggleTerm<CR>", opts},
	{"t", "<C-k>", "<C-\\><C-n><C-w>k", opts},
	{"t", "<C-j>", "<C-\\><C-n><C-w>j", opts},
	-- Last tab
	{"n", "<A-9>", ":$tabnext<CR>", opts},
}

-- Make Alt + 1-8 select tabs
for i = 1, 8 do
	local v = {"n","<A-"..i..">", i.."gt", opts}
	table.insert(mappings,v)
end

for _, map in pairs(mappings) do
	vim.api.nvim_set_keymap(unpack(map))
end

local utils = require("modules.utils")

local autocmds = {
	general = {
		-- Exit netrw with esc
		{'Filetype netrw nnoremap <buffer> <esc> <C-^>'},
		-- Spell check
		{'FileType nroff,mail set spell spelllang=pt_br | set tw=80'},
		{'FileType markdown set spell spelllang=en | set tw=80'},
		{'FileType haskell set expandtab'},
		-- Make when saving .ms groff files
		{'BufWritePost *.ms :silent exec "!make"'},
	}
}

utils.nvim_create_augroups(autocmds)

setvars()
setopts()

require("modules.statusbar")
