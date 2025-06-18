return {
	{ "nvim-tree/nvim-web-devicons", config = true },
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = function()
			local wk = require("which-key")

			wk.add({
				{"<Leader>d", group = "Diagnostics"},
				{"<Leader>e", group = "File Explorer"},
				{"<Leader>f", group = "Project and Files"},
				{"<Leader>g", group = "Git"},
				{"<Leader>j", group = "Java"},
				{"<Leader>t", group = "Terminal and Tabs"},
			})

		end -- end of config
	}
}
