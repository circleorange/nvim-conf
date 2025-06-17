return {
	"VonHeikemen/fine-cmdline.nvim",
	dependencies = {
		"MunifTanjim/nui.nvim"
	},
	config = function()
		-- local deps = require("utils.deps")
		-- deps.cmdline.setup({opts})
		require("fine-cmdline").setup({
			cmdline = {
				enable_keymaps	= true,		-- Use default keymaps, otherwise need to define all keymaps
				prompt			= ": ",		-- Set text in the prompt
			},
			popup = {
				position		= { row = "10%", col = "50%" },
				size			= { width = "60%" },
				border			= { style = "rounded" },
				win_options		= {"Normal:Normal,FloatBorder:FloatBorder"},
			}
		})
	end
}
