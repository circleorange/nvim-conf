return {
	"folke/which-key.nvim",
	event	= "VeryLazy",
	config	= function()

		require"which-key".add {
			{"<Leader>b", group = "Buffer"},
			{"<Leader>d", group = "Diagnostics"},
			{"<Leader>e", group = "Explorer"},
			{"<Leader>f", group = "Find (Files, Project)"},
			{"<Leader>g", group = "Git"},
			{"<Leader>j", group = "Java"},
			{"<Leader>p", group = "Python"},
			{"<Leader>s", group = "Search"},
			{"<Leader>t", group = "Terminal"},
			{"<Leader>u", group = "Toggle"},
		}
	end -- config
}

