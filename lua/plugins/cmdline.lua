return {
	"VonHeikemen/fine-cmdline.nvim",
	dependencies = {
		"MunifTanjim/nui.nvim"
	},
	opts = {
		cmdline = { enable_keymaps = true }, -- use defaule keymaps
		popup = {
			position = { row = "10%", col = "50%" },
			size = { width = "60%" },
			border = { style = "rounded" }
		}
	},
	config = function(_, opts)
		local deps = require("utils.deps")
		deps.cmdline.setup({opts})
	end
}
