return {
	-- Highlight, edit, and navigate code
	-- :TSInstall <lang>: Install parser
	-- :TSUpdate: Update all parsers
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	lazy = false,
	build = ":TSUpdate",
	config = function() 
		require("nvim-treesitter.configs").setup({
			ensure_installed = { "bash", "lua", "luadoc", "c", "markdown", "markdown_inline", "html", "java", "python", "yaml", "json" },
			auto_install = true, -- install missing parsers when entering buffer
			sync_install = false, -- install parsers synchronously
			ignore_install = {}, -- list of parsers to ignore
			highlight = { enable = true },
		})
	end,
}
