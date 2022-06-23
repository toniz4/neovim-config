local utils = {}
local api = vim.api

utils.feedkey = function(key, mode)
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

utils.escape_keymap = function(key)
	return "k" .. key:gsub(".", string.byte)
end

local removekey = function(table, key)
   local element = table[key]
   table[key] = nil
   return element
end

utils.create_augroup_autocmd = function(definitions)
	for group_name, definition in pairs(definitions) do
		local id = api.nvim_create_augroup(group_name, {})

		for _, def in pairs(definition) do
			local event = def.event
			removekey(def, "event")
			local opts = def
			opts.group = id

			api.nvim_create_autocmd(event, opts)
		end
	end
end


utils.update = function()
	for k in pairs(package.loaded) do
		if k:match("^plugins") then
			package.loaded[k] = nil
		end
	end

	local packer = require("plugins")

	packer.sync()
end

return utils
