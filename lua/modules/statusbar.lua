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
		{'n', 'NOR', '%5*'},
		{'no', 'NOR', '%5*'},
		{'nov', 'NOR', '%5*'},
		{'noV', 'NOR', '%5*'},
		{'no', 'NOR', '%5*'},
		{'niI', 'NORMAL-I', '%5*'},
		{'niR', 'NORMAL-R', '%5*'},
		{'niV', 'NORMAL-V', '%5*'},
		{'v', 'VIS', '%7*'},
		{'V', 'VIL', '%7*'},
		{'', 'VIB', '%7*'},
		{'s', 'VIB', '%7*'},
		{'S', 'VIB', '%7*'},
		{'', 'VIB', '%7*'},
		{'i', 'INS', '%6*'},
		{'ic', 'INS', '%6*'},
		{'ix', 'INS', '%6*'},
		{'R', 'REP', '%8*'},
		{'Rc', 'REP', '%8*'},
		{'Rv', 'REV', '%8*'},
		{'Rx', 'REP', '%8*'},
		{'c', 'COM', '%9*'},
		{'c', 'COM', '%9*'},
		{'cv', 'COM', '%9*'},
		{'ce', 'COM', '%9*'},
		{'t', 'TER', '%9*'},
	}

	for _, map in pairs(ppMode) do
		if mode == map[1] then
			return map[3] .. " " .. map[2] .. ' %0*'
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
		function() return ' »%<' end,
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
