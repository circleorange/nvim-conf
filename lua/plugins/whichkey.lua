return {
	"folke/which-key.nvim",
	event	= "VeryLazy",
	config	= function()

		require"which-key".add {
			{"<Leader>d", group = "Diagnostics"},
			{"<Leader>e", group = "File Explorer"},
			{"<Leader>f", group = "Project and Files"},
			{"<Leader>g", group = "Git"},
			{"<Leader>j", group = "Java"},
			{"<Leader>t", group = "Terminal and Tabs"},
		}
	end -- config
}

