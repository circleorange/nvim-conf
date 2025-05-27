return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" }, -- load when opening or creating file
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"nvim-tree/nvim-web-devicons"
		},
		config = function()
			require("config.lspconfig").setup()
		end
	},
	{
		"williamboman/mason.nvim",
		cmd = "Mason", -- load when the mason command is executed
		config = function()
			require("config.mason").setup_mason()
		end
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"neovim/nvim-lspconfig"
		},
		config = function()
			require("config.mason").setup_mason_lspconfig()
		end
	},
	{
		"nvim-tree/nvim-web-devicons",
		lazy = true
	}
}
