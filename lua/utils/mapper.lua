local M = {}

-- Set key map for plugin requiring function call
function fmap(modes, key, fn, desc)
    local opts = {}
    if desc then opts.desc = desc end
    vim.keymap.set(modes, key, fn, opts)
end

-- Generic key mapper
function M.set_map(mode, key, fn, desc)
	vim.keymap.set(mode, key, fn, {desc = desc})
end

function M.map_old(mode, lhs, rhs, opts)
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

