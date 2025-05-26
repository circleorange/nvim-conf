return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" }, -- optional, for file-icons
	config = function()
		require("oil").setup({
			use_default_file_explorer = true,

			-- see :help oil-setup for all options
			columns = { "icon", "permissions", "size", "mtime" },

			-- window-local options to use for oil buffers
			win_options = {
				wrap = false,
				signcolumn = "no",
				cursorcolumn = false,
				foldcolumn = "0",
			},

			delete_to_trash = true, -- send deleted files to trash instead of permanent delete
			skip_confirm_for_simple_edits = false, -- skip confirmation popup
			prompt_save_on_select_new_entry = true, -- prompt to save changes on selecting new/ moved/ renamed directory
			view_options = {
				show_hidden = true,
				is_real_file = true,
			},
			
			keymaps = {
				["<CR>"] = "actions.select",
				["-"] = "actions.parent",
				["<C-h>"] = "actions.toggle_hidden",
				["<C-r>"] = "actions.refresh",
				["?"] = "actions.show_help",
			},
			use_default_keymaps = true, -- false to disable all of the above custom keymaps

			-- configurations for floating window in oil.open_float
			float = {
				padding = 2,
				border = "rounded",
			},
		})
	end,
}
