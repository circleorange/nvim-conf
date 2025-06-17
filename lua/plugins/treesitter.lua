return {
	-- Tree-based syntax highlighting (https://github.com/nvim-treesitter/nvim-treesitter).
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
	event	= "BufReadPost",
	opts	= {
		ensure_installed = {
			"lua", "vim",
			--"bash", "dockerfile",

			-- Data
			--"yaml", "json", "toml", "xml",
			--"markdown", "markdown_inline",

			-- Frontend languages
			--"html",

			-- Backend languages
			--"c", "cpp", "cmake",
			--"java",
			"python",
		},
	},
	config	= function(_, opts)
		local ts = require "nvim-treesitter"
		ts.setup()
		ts.install(opts.ensure_installed)
		-- Treesitter feautures need to be manually enabled
		vim.api.nvim_create_autocmd("FileType", {
			pattern = {"lua", "python"},
			callback = function()
				local ok = pcall(vim.treesitter.start) -- Syntax highlighting, provided by nvim-treesitter
				if not ok then print("Treesitter failed to start") return end
				vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()" -- Folds, by Neovim
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()" -- Indentation, by nvim-treesitter
			end
		})
	end,
}
