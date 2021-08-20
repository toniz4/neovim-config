local isRO = function()
	if vim.bo.readonly then
		return " "
	else
		return ""
	end
end

local modified = function()
	if vim.bo.modified then
		return " + "
	else
		return ""
	end
end

local filetype = function()
	filetype = vim.bo.filetype
	if filetype then
		return filetype .. ' « '
	else
		return ''
	end
end

local totalBufN = function()
	local n = 0
	for _,buf in pairs(vim.api.nvim_list_bufs()) do
		if vim.api.nvim_buf_is_loaded(buf) then
			n = n + 1
		end
	end
	return n
end

local showmode = function()
	local mode = vim.fn.mode()

	local ppMode = {
		{'n', 'NOR', '%1*'},
		{'no', 'NOR', '%1*'},
		{'nov', 'NOR', '%1*'},
		{'noV', 'NOR', '%1*'},
		{'no', 'NOR', '%1*'},
		{'niI', 'NORMAL-I', '%1*'},
		{'niR', 'NORMAL-R', '%1*'},
		{'niV', 'NORMAL-V', '%1*'},
		{'v', 'VIS', '%3*'},
		{'V', 'VIL', '%3*'},
		{'', 'VIB', '%3*'},
		{'s', 'VIB', '%3*'},
		{'S', 'VIB', '%3*'},
		{'', 'VIB', '%3*'},
		{'i', 'INS', '%2*'},
		{'ic', 'INS', '%2*'},
		{'ix', 'INS', '%2*'},
		{'R', 'REP', '%6*'},
		{'Rc', 'REP', '%6*'},
		{'Rv', 'REV', '%6*'},
		{'Rx', 'REP', '%6*'},
		{'c', 'COM', '%4*'},
		{'c', 'COM', '%4*'},
		{'cv', 'COM', '%4*'},
		{'ce', 'COM', '%4*'},
		{'t', 'TER', '%4*'},
	}

	for _, map in pairs(ppMode) do
		if mode == map[1] then
			return map[3] .. " " .. map[2] .. " »" .. '%*'
		end
	end
end

function CallFuncs(funcs)
	for _, func in pairs(funcs) do
		func()
	end
end

local line = {
	left = {
		showmode,
		function() return '%<' end,
		isRO,
		function() return ' %f' end,
		modified,
	},
	right = {
		filetype,
		function() return ' %l::%c ' end,
	}
}

statusline = function()
	local status = ''
	for _, func in pairs(line.left) do
		status = status .. func()
	end

	status = status .. '%='

	for _, func in pairs(line.right) do
		status = status .. func()
	end

	if vim.g.statusline_winid ~= vim.fn.win_getid() then
		return '%f'
	end

	return status
end

vim.o.statusline = '%!v:lua.statusline()'
vim.wo.statusline = '%!v:lua.statusline()'
