return {
	-- Collection of small quality-of-life plugins.
	-- (ai, align, comment, completion, keymap, move, pairs, snippets, surround, pick, trailspace)
	--
	"echasnovski/mini.nvim",
	event = "VeryLazy",
	config = function()
		-- Enable automatic matching pairs
		require("mini.pairs").setup {
			modes = { insert = true, command = false, terminal = false },
		}

		-- Expand/ Shrink selection of textobjects
		--
		-- Usage:
		--		> vi"	- Select textobject inside ""
		--		> vi"i(	- Select textobject inside "", then Expand selection inside ()
		require "mini.ai".setup {
			mappings = {
				-- Main textobject prefixes
				around = 'a',
				inside = 'i',
				-- Expand/ Shrink
				around_next = 'an',
				inside_next = 'in',
				around_last = 'al',
				inside_last = 'il',
				-- Move cursor to corresponding edge of 'a' textobject
				goto_left = 'g[',
				goto_right = 'g]',
			}
		}
	end
}
