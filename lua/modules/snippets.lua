local snippets = require'snippets'
local U = require'snippets.utils'
snippets.snippets = {
	_global = {
	-- If you aren't inside of a comment, make the line a comment.
	copyright = U.force_comment [[Copyright (C) Ashkan Kiani ${=os.date("%Y")}]];
	todo = U.force_comment "TODO: ";
};
	c = {
		["for"] = U.match_indentation "for (int ${1:i = 0}; ${2:i < } ${3:i++}) {\n\t$0\n}";
	};
}
