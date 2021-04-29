-- Keybinds: {{{
local opts = {expr = true, silent = true}
local mappings = {
	{"i", "<CR>", "v:lua.compeCR()", opts},
	{"i", "<Tab>", "v:lua.tab_complete()", opts},
	{"s", "<Tab>", "v:lua.tab_complete()", opts},
	{"i", "<S-Tab>", "v:lua.s_tab_complete()", opts},
	{"s", "<S-Tab>", "v:lua.s_tab_complete()", opts}
}

for _, map in pairs(mappings) do
	vim.api.nvim_set_keymap(unpack(map))
end

local t = function(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end

_G.compeCR = function()
	if vim.fn.pumvisible() == 1 and vim.fn.complete_info()['selected'] ~= -1 then
		-- return t("<Plug>(compe-confirm)")
		vim.fn['compe#confirm']({select = true})
	else
		return require("consclose").consCR() .. t("<Plug>DiscretionaryEnd")
	end
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
--}}}
-- Compe: {{{
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'disable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 40;
  max_kind_width = 40;
  max_menu_width = 40;
  documentation = true;
  sort = false;

  source = {
    path = true;
    buffer = false;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = true;
  };
}
--- }}}
-- Lsp config {{{

local lspconfig = require('lspconfig')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}

lspconfig.ccls.setup {
	capabilities = capabilities,
	init_options = {
		cache = {
			directory = "/tmp/ccls"
		},
		index = {
			threads = 4;
		},
	}
}

-- lspconfig.clangd.setup {
-- 	capabilities = capabilities
-- }


local sumneko_root_path = vim.fn.stdpath('cache')..'/lspconfig/sumneko_lua/lua-language-server'
local sumneko_binary = sumneko_root_path.."/bin/Linux/lua-language-server"

require'lspconfig'.sumneko_lua.setup {
	cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT',
				-- Setup your lua path
				path = vim.split(package.path, ';'),
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = {'vim'},
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = {
					[vim.fn.expand('$VIMRUNTIME/lua')] = true,
					[vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
				},
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
}

local util = require('lspconfig.util')

lspconfig.gopls.setup{
	root_dir = function(fname)
	 	return util.root_pattern("go.mod", ".git")(fname) or
	 	util.path.dirname(fname)
	end,
	init_options = {
	 	usePlaceholders = true,
	},
	capabilities = capabilities
}
-- vim:fdm=marker
--}}}
