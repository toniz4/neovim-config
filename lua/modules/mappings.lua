local utils = require('modules.utils')

local mappings = {}

mappings.enter  = function()
	return utils.feedkey(require("consclose").consCR() .. "<Plug>DiscretionaryEnd", "")
end

return mappings
