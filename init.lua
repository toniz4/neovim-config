local packer = require("plugins")

local globalOpts = {
	backup = false,
	cindent = true,
	errorbells = false,
	hidden = true,
	ignorecase = true,
	inccommand = "split",
	incsearch = true,
	laststatus = 2,
	cmdheight = 1,
	mouse = vim.o.mouse .. "a",
	scrolloff = 2,
	shortmess = vim.o.shortmess .. "c",
	showmode = false,
	smartcase = true,
	synmaxcol = 200,
	termguicolors = true,
	timeoutlen = 500,
	writebackup = false,
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

vim.o.clipboard = vim.o.clipboard .. "unnamedplus"

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
	consclose_no_mappings = 0,
	endwise_no_mappings = 0,
}

for k, v in pairs(globalVars) do
	vim.g[k] = v
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
	-- {"n", "<C-h>", "<C-w>h", opts},
	-- {"n", "<C-j>", "<C-w>j", opts},
	-- {"n", "<C-k>", "<C-w>k", opts},
	-- {"n", "<C-l>", "<C-w>l", opts},
	-- Disable highlight with leader l
	{"n", "<leader>l", ":nohlsearch<CR>", opts},
	-- Terminal keybinds
	{"n", "<F2>",      ":ToggleTerm<CR>", opts},
	{"n", "<leader>t", ":ToggleTerm<CR>", opts},
	{"t", "<F2>", "<C-\\><C-n>:ToggleTerm<CR>", opts},
	-- {"t", "<C-k>", "<C-\\><C-n><C-w>k", opts},
	-- {"t", "<C-j>", "<C-\\><C-n><C-w>j", opts},
	-- Last tab
	{"n", "<A-9>", ":$tabnext<CR>", opts},

	{"n", "<leader>up", [[:lua require("modules.utils").update()<CR>]], opts},

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

if os.getenv("TERM") == 'linux' then
	vim.cmd("colorscheme solitary")
else
	vim.cmd("colorscheme mountainplex")
end

require("modules.statusbar")
require("modules.lsp")
