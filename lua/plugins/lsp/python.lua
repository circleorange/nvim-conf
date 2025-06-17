return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"mfussenegger/nvim-dap",
	},
	config = function()
		-- require("lspconfig").pyright.setup({
		vim.lsp.config("pyright", {
			-- Defaults:
			-- cmd			= {"pyright-langserver", "--stdio"}
			-- root_files	= {"pyproject.toml", "setup.py", "requirements.txt", ".git"}
			-- filetypes	= {"python"}
			-- Enabled: single_file_support
			settings = { python = { analysis = {
					autoSearchPaths			= true,
					useLibraryCodeForTypes	= true,
					diagnosticMode			= "workspace",
			}}}
		})
	end,
}
