return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local deps = require("utils.deps")
		deps.telescope.setup()
	end,
}
