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
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

_G.packer_plugins = {
  ["completion-nvim"] = {
    loaded = true,
    path = "/home/cassio/.local/share/nvim/site/pack/packer/start/completion-nvim"
  },
  ["consclose.nvim"] = {
    config = { "\27LJ\1\2[\0\0\2\0\4\0\t4\0\0\0007\0\1\0'\1\0\0:\1\2\0004\0\0\0007\0\1\0'\1\0\0:\1\3\0G\0\1\0\24endwise_no_mappings\26consclose_no_mappings\6g\bvim\0" },
    loaded = true,
    path = "/home/cassio/.local/share/nvim/site/pack/packer/start/consclose.nvim"
  },
  ["gentoo-syntax"] = {
    loaded = true,
    path = "/home/cassio/.local/share/nvim/site/pack/packer/start/gentoo-syntax"
  },
  ["lsp-status.nvim"] = {
    loaded = true,
    path = "/home/cassio/.local/share/nvim/site/pack/packer/start/lsp-status.nvim"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\1\2+\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\16modules.lsp\frequire\0" },
    loaded = true,
    path = "/home/cassio/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/cassio/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/home/cassio/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-css-color"] = {
    loaded = true,
    path = "/home/cassio/.local/share/nvim/site/pack/packer/start/vim-css-color"
  },
  ["vim-dirvish"] = {
    loaded = true,
    path = "/home/cassio/.local/share/nvim/site/pack/packer/start/vim-dirvish"
  },
  ["vim-endwise"] = {
    loaded = true,
    path = "/home/cassio/.local/share/nvim/site/pack/packer/start/vim-endwise"
  },
  ["vim-paper"] = {
    config = { "\27LJ\1\2\1\0\0\2\0\b\0\0164\0\0\0007\0\1\0%\1\2\0>\0\2\2\a\0\3\0T\0\5€4\0\4\0007\0\5\0%\1\6\0>\0\2\1T\0\4€4\0\4\0007\0\5\0%\1\a\0>\0\2\1G\0\1\0\24colorscheme greyish\25colorscheme darkblue\bcmd\bvim\nlinux\tTERM\vgetenv\aos\0" },
    loaded = true,
    path = "/home/cassio/.local/share/nvim/site/pack/packer/start/vim-paper"
  },
  ["vim-startuptime"] = {
    loaded = true,
    path = "/home/cassio/.local/share/nvim/site/pack/packer/start/vim-startuptime"
  },
  ["vim-stt"] = {
    loaded = true,
    path = "/home/cassio/.local/share/nvim/site/pack/packer/start/vim-stt"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/home/cassio/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  },
  ["vim-vsnip-integ"] = {
    loaded = true,
    path = "/home/cassio/.local/share/nvim/site/pack/packer/start/vim-vsnip-integ"
  }
}

-- Config for: nvim-lspconfig
try_loadstring("\27LJ\1\2+\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\16modules.lsp\frequire\0", "config", "nvim-lspconfig")
-- Config for: vim-paper
try_loadstring("\27LJ\1\2\1\0\0\2\0\b\0\0164\0\0\0007\0\1\0%\1\2\0>\0\2\2\a\0\3\0T\0\5€4\0\4\0007\0\5\0%\1\6\0>\0\2\1T\0\4€4\0\4\0007\0\5\0%\1\a\0>\0\2\1G\0\1\0\24colorscheme greyish\25colorscheme darkblue\bcmd\bvim\nlinux\tTERM\vgetenv\aos\0", "config", "vim-paper")
-- Config for: consclose.nvim
try_loadstring("\27LJ\1\2[\0\0\2\0\4\0\t4\0\0\0007\0\1\0'\1\0\0:\1\2\0004\0\0\0007\0\1\0'\1\0\0:\1\3\0G\0\1\0\24endwise_no_mappings\26consclose_no_mappings\6g\bvim\0", "config", "consclose.nvim")
END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
