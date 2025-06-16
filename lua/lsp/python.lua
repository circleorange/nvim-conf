return {
	"neovim/nvim-lspconfig",
	ft = "python",
	dependencies = {
		"williamboman/mason.nvim",
		"mfussenegger/nvim-dap",
	},
	opts	= {},
	config	= function()
		require("pyright").setup({
			settings = { python = {
				pythonPath = "python3",
				analysis = {
					autoSearchPaths			= true,
					useLibraryCodeForTypes	= true,
					diagnosticMode			= "workspace",
					typeCheckingMode		= "basic",
				},
			}}
		})
	end,
}
