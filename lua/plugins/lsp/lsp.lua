return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{  -- Mason: installer UI + registry
			"williamboman/mason.nvim",
			build = ":MasonUpdate",
			config = function()
				require("mason").setup({ ui = { border = "rounded" } })
			end
		},
		{
			"williamboman/mason-lspconfig.nvim",
			dependencies = { "williamboman/mason.nvim" },
			config = function()
				local lsp = require("config.lsp")
				require("mason-lspconfig").setup({
					ensure_installed = lsp.ensure_installed,
					automatic_installation = true
				})
			end
		},
		{ 
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			dependencies = { "williamboman/mason.nvim" },
			config = function()
				local lsp = require("config.lsp")
				require("mason-tool-installer").setup({
					ensure_installed = lsp.ensure_installed,
					auto_update = true
				})
			end
		}
	},
	config = function()
		require("config.lsp") -- load shared capabilities and on_attach
	end,
}
