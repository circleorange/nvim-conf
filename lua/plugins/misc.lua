return {
	{ "nvim-tree/nvim-web-devicons", config = true },
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = function()
			local wk = require("which-key")

			wk.add({
				{"<Leader>f", group = "Project and Files"},
				{"<Leader>t", group = "Terminal and Tabs"},
				{"<Leader>j", group = "Java"},
				{"<Leader>g", group = "Git"},
				{"<Leader>q", group = "Diagnostics"},
			})

		end -- end of config
	}
}
