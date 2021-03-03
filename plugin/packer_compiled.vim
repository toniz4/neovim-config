" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
local package_path_str = "/home/cassio/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?.lua;/home/cassio/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?/init.lua;/home/cassio/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?.lua;/home/cassio/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/cassio/.cache/nvim/packer_hererocks/2.0.5/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

local function try_loadstring(s, component, name)
  local success, err = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(err)
  end
end

_G.packer_plugins = {
  ["canus.nvim"] = {
    config = { 'try_loadstring("\\27LJ\\1\\0025\\0\\0\\2\\0\\3\\0\\0054\\0\\0\\0007\\0\\1\\0%\\1\\2\\0>\\0\\2\\1G\\0\\1\\0\\22colorscheme canus\\bcmd\\bvim\\0", "config", "canus.nvim")' },
    loaded = true,
    path = "/home/cassio/.local/share/nvim/site/pack/packer/start/canus.nvim"
  },
  ["gentoo-syntax"] = {
    loaded = true,
    path = "/home/cassio/.local/share/nvim/site/pack/packer/start/gentoo-syntax"
  },
  ["haskell-vim"] = {
    config = { 'try_loadstring("\\27LJ\\1\\2—\\2\\0\\0\\a\\0\\4\\0\\v3\\0\\0\\0004\\1\\1\\0\\16\\2\\0\\0>\\1\\2\\4D\\4\\3€4\\6\\2\\0007\\6\\3\\0069\\5\\4\\6B\\4\\3\\3N\\4ûG\\0\\1\\0\\6g\\bvim\\npairs\\1\\0\\t\\22haskell_indent_if\\3\\3 haskell_indent_before_where\\3\\2\\23haskell_indent_let\\3\\4$haskell_indent_after_bare_where\\3\\2\\24haskell_indent_case\\3\\2\\25haskell_indent_guard\\3\\2\\25haskell_indent_where\\3\\6\\22haskell_indent_in\\3\\1\\22haskell_indent_do\\3\\3\\0", "config", "haskell-vim")' },
    loaded = true,
    path = "/home/cassio/.local/share/nvim/site/pack/packer/start/haskell-vim"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/home/cassio/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    config = { 'try_loadstring("\\27LJ\\1\\2+\\0\\0\\2\\0\\2\\0\\0044\\0\\0\\0%\\1\\1\\0>\\0\\2\\1G\\0\\1\\0\\16modules.lsp\\frequire\\0", "config", "nvim-lspconfig")' },
    loaded = true,
    path = "/home/cassio/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["packer.nvim"] = {
    loaded = false,
    path = "/home/cassio/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["snippets.nvim"] = {
    loaded = true,
    path = "/home/cassio/.local/share/nvim/site/pack/packer/start/snippets.nvim"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/home/cassio/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-css-color"] = {
    loaded = true,
    path = "/home/cassio/.local/share/nvim/site/pack/packer/start/vim-css-color"
  },
  ["vim-startuptime"] = {
    loaded = true,
    path = "/home/cassio/.local/share/nvim/site/pack/packer/start/vim-startuptime"
  },
  ["vim-vinegar"] = {
    loaded = true,
    path = "/home/cassio/.local/share/nvim/site/pack/packer/start/vim-vinegar"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/home/cassio/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  }
}

-- Config for: nvim-lspconfig
try_loadstring("\27LJ\1\2+\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\16modules.lsp\frequire\0", "config", "nvim-lspconfig")
-- Config for: haskell-vim
try_loadstring("\27LJ\1\2—\2\0\0\a\0\4\0\v3\0\0\0004\1\1\0\16\2\0\0>\1\2\4D\4\3€4\6\2\0007\6\3\0069\5\4\6B\4\3\3N\4ûG\0\1\0\6g\bvim\npairs\1\0\t\22haskell_indent_if\3\3 haskell_indent_before_where\3\2\23haskell_indent_let\3\4$haskell_indent_after_bare_where\3\2\24haskell_indent_case\3\2\25haskell_indent_guard\3\2\25haskell_indent_where\3\6\22haskell_indent_in\3\1\22haskell_indent_do\3\3\0", "config", "haskell-vim")
-- Config for: canus.nvim
try_loadstring("\27LJ\1\0025\0\0\2\0\3\0\0054\0\0\0007\0\1\0%\1\2\0>\0\2\1G\0\1\0\22colorscheme canus\bcmd\bvim\0", "config", "canus.nvim")
END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
