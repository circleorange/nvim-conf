return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		-- Runs when plugin updated/ installed, not when opening neovim
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make", cond = function() return vim.fn.executable("make") == 1 end, },
		{ "nvim-telescope/telescope-ui-select.nvim" }, 
		{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font }
	},
	config = function()
		require("telescope").setup({})

		-- enable telescope extensions, if installed
		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "ui-select")

		local map = vim.keymap.set
		local builtin = require("telescope.builtin")

		map("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
		map("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
		map("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
		map("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
		map("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
		map("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
		map("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
		map("n", "<leader>s.", builtin.oldfiles, { desc = "[S]earch recent files ('.' for repeat)" })
		map("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })
		-- map("n", "<leader>/", builtin.current_buffer_fuzzy_find, desc = { "[/] Fuzzy search in current buffer" })
		map("n", "<leader>sn", function() 
			builtin.find_files({
				cwd = vim.fn.stdpath("config"),
			})
		end, { desc = "[S]earch [N]eovim files" })
	end,
}
