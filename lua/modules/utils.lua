local utils = {}
local api = vim.api

utils.feedkey = function(key, mode)
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

utils.escape_keymap = function(key)
	return "k" .. key:gsub(".", string.byte)
end

-- grabbed from https://github.com/norcalli/nvim_utils
utils.nvim_create_augroups = function(definitions)
	for group_name, definition in pairs(definitions) do
		api.nvim_command("augroup " .. group_name)
		api.nvim_command("autocmd!")
	for _, def in ipairs(definition) do
		local command = table.concat(vim.tbl_flatten {"autocmd", def}, " ")
		api.nvim_command(command)
	end
		api.nvim_command("augroup END")
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
