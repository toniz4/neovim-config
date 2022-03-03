-- Keybinds: {{{
local opts = {expr = true, silent = true}
local mappings = {
	-- {"i", "<CR>", "v:lua.CR()", opts},
	-- {"i", "<Tab>", "v:lua.tab_complete()", opts},
	-- {"s", "<Tab>", "v:lua.tab_complete()", opts},
	-- {"i", "<S-Tab>", "v:lua.s_tab_complete()", opts},
	-- {"s", "<S-Tab>", "v:lua.s_tab_complete()", opts}
}

for _, map in pairs(mappings) do
	vim.api.nvim_set_keymap(unpack(map))
end

_G.tab_complete = function()
	if vim.fn.call("vsnip#available", {1}) == 1 then
		return "<Plug>(vsnip-expand-or-jump)"
	else
		return "<Tab>"
	end
end

_G.s_tab_complete = function()
	if vim.fn.call("vsnip#jumpable", {-1}) == 1 then
		return "<Plug>(vsnip-jump-prev)"
	else
		return "<S-Tab>"
	end
end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end
--}}}
-- Compe: {{{
-- Compe setup

local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end


local utils = require('modules.utils')
local cmp = require'cmp'

cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
			-- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
			-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
			-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
		end,
	},
	mapping = {
		['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
		['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
		['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
		['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
		['<C-e>'] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif vim.fn["vsnip#available"](1) == 1 then
				utils.feedkey("<Plug>(vsnip-expand-or-jump)", "")
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function()
			if cmp.visible() then
				cmp.select_prev_item()
			elseif vim.fn["vsnip#jumpable"](-1) == 1 then
				feedkey("<Plug>(vsnip-jump-prev)", "")
			end
		end, { "i", "s" }),
	},
	sources = cmp.config.sources({
		{
			name = 'nvim_lsp',
			priority = 40
		},
		{ 
			name = 'vsnip',
			priority = 50
		},
		{ 
			name = 'buffer',
			priority = 30
		},
		{ 
			name = 'path',
			priority = 50
		},
		{ 
			name = 'spell',
			priority = 60
		},
		-- { name = 'luasnip' }, -- For luasnip users.
		-- { name = 'ultisnips' }, -- For ultisnips users.
		-- { name = 'snippy' }, -- For snippy users.
	}, {
		{ name = 'buffer' },
	})
})

	-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
	-- cmp.setup.cmdline('/', {
	-- 	sources = {
	-- 		{ name = 'buffer' }
	-- 	}
	-- })

	-- -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
	-- cmp.setup.cmdline(':', {
	-- 	sources = cmp.config.sources({
	-- 		{ name = 'path' }
	-- 	}, {
	-- 		{ name = 'cmdline' }
	-- 	})
	-- })

--- }}}
-- Lsp config {{{

local lspconfig = require('lspconfig')

-- capabilities.textDocument.completion.completionItem.snippetSupport = true;

-- local capabilities = vim.lsp.protocol.make_client_capabilities()

 local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- capabilities.textDocument.completion.completionItem.snippetSupport = true;

lspconfig.ccls.setup {
	capabilities = capabilities;
    on_attach = on_attach;
	flags = {
      debounce_text_changes = 150,
    };
	init_options = {
		cache = {
			directory = "/tmp/ccls"
		},
		index = {
			threads = 4;
		},
	}
}

local util = require('lspconfig.util')

lspconfig.gopls.setup{
	capabilities = capabilities;
	root_dir = function(fname)
	 	return util.root_pattern("go.mod", ".git")(fname) or
	 	util.path.dirname(fname)
	end,
	init_options = {
	 	usePlaceholders = true,
	},
}

require'lspconfig'.elixirls.setup{
    -- Unix
	capabilities = capabilities;
    cmd = {"/home/cassio/src/elixir-ls/release/language_server.sh"};
}


-- local sumneko_root_path = vim.fn.stdpath('cache')..'/lspconfig/sumneko_lua/lua-language-server'
-- local sumneko_binary = sumneko_root_path.."/bin/Linux/lua-language-server"

-- require'lspconfig'.sumneko_lua.setup {
-- 	cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
-- 	settings = {
-- 		Lua = {
-- 			runtime = {
-- 				version = 'LuaJIT',
-- 				-- Setup your lua path
-- 				path = vim.split(package.path, ';'),
-- 			},
-- 			diagnostics = {
-- 				-- Get the language server to recognize the `vim` global
-- 				globals = {'vim'},
-- 			},
-- 			workspace = {
-- 				-- Make the server aware of Neovim runtime files
-- 				library = {
-- 					[vim.fn.expand('$VIMRUNTIME/lua')] = true,
-- 					[vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
-- 				},
-- 			},
-- 			-- Do not send telemetry data containing a randomized but unique identifier
-- 			telemetry = {
-- 				enable = false,
-- 			},
-- 		},
-- 	},
-- }

-- vim:fdm=marker
--}}}
