
require("modules.snippets")

-- require'lspconfig'.clangd.setup{on_attach=require'completion'.on_attach}

require'snippets'.use_suggested_mappings()

vim.g.completion_enable_snippet = 'snippets.nvim'
vim.g.completion_auto_change_source = 1

local opts = {noremap = true, expr = true}
local mappings = {
	{"i", "<Tab>", [[pumvisible() ? "<C-p>" : "<Tab>"]], opts},
	{"i", "<Tab>", [[pumvisible() ? "<C-n>" : "<S-Tab>"]], opts},
	{"i", "<CR>", [[compe#confirm('<CR>')]], opts}
}

for _, map in pairs(mappings) do
	vim.api.nvim_set_keymap(unpack(map))
end

require'compe'.setup {
	enabled = true;
	autocomplete = true;
	debug = false;
	min_length = 1;
	preselect = 'enable';
	throttle_time = 80;
	source_timeout = 200;
	incomplete_delay = 400;
	max_abbr_width = 100;
	max_kind_width = 100;
	max_menu_width = 100;
	documentation = true;

	source = {
		path = true;
		buffer = true;
		calc = true;
		vsnip = true;
		nvim_lsp = true;
		nvim_lua = true;
		spell = true;
		tags = true;
		snippets_nvim = true;
		treesitter = true;
	};
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.clangd.setup {
	capabilities = capabilities,
}


local t = function(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
	if vim.fn.pumvisible() == 1 then
		return t "<C-n>"
	elseif vim.fn.call("vsnip#available", {1}) == 1 then
		return t "<Plug>(vsnip-expand-or-jump)"
	else
		return t "<Tab>"
	end
end
_G.s_tab_complete = function()
	if vim.fn.pumvisible() == 1 then
		return t "<C-p>"
	elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
		return t "<Plug>(vsnip-jump-prev)"
	else
		return t "<S-Tab>"
	end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
