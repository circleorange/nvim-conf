local M = {}

-- generic key mapper
function M.map(mode, lhs, rhs, opts)
	opts = vim.tbl_extend("force", { noremap = true, silent = true }, opts or {})
	vim.keymap.set(mode, lhs, rhs, opts)
end

-- create mode-specific shortcuts
for _, mode in ipairs({"n", "i", "v", "x", "t", "c"}) do
	M[mode .. "map"] = function(lhs, rhs, opts)
		M.map(mode, lhs, rhs, opts) -- reuse M.map but hardcode the mode
	end
end

return M

