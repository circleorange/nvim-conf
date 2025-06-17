return {
	-- Tree-based syntax highlighting.
	--
	-- Commands:
	--		- <Cmd>TSInstall {lang}	- Install specific LSP, can be `all`.
	--		- <Cmd>TSUpdate			- Update all installed languages, or specify with {language}.
	--		- <Cmd>TSLog			- Show logs from previous installations, updates, and uninstalls.
	--
	"nvim-treesitter/nvim-treesitter",
	branch	= "main",
	lazy	= false,
	build	= ":TSUpdate",
	config	= function()
		local ts = require("nvim-treesitter")

		-- No longer need to call setup() using new version of treesitter.

		ts.install({
			-- Scripting
			"lua", "luadoc",
			"bash", "dockerfile",

			-- Data
			"yaml", "json", "toml", "xml",
			"markdown", "markdown_inline",

			-- Frontend languages
			"html",

			-- Backend languages
			"c", "cpp", "cmake",
			"java",
			"python",
		})
		vim.api.nvim_create_autocmd("FileType", {
			pattern = {"lua", "python"},
			callback = function()
				vim.treesitter.start()
			end
		})
	end,
}
