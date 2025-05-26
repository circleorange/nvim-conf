return {
	"neovim/nvim-lspconfig",
	ft = "lua",
	dependencies = {
		"folke/neodev.nvim", -- enhance Lua LSP for Neovim API
		"hrsh7th/cmp-nvim-lsp", -- completion source for LSP
	},
	config = function()
		local my_lsp_conf = require("config.lsp")
		local lspconfig = require("lspconfig")

		require("neodev").setup({}) -- neovim lua settings

		lspconfig.lua_ls.setup({
			capabilities = my_lsp_conf.capabilities,
			on_attach = my_lsp_conf.on_attach,
			settings = {
				Lua = {
					runtime = { version = "LuaJIT" },
					diagnostics = { globals = { "vim" }},
					workspace = {
						library = vim.api.nvim_get_runtime_file("", true),
						checkThirdParty = false
					},
					telemetry = { enable = false },
				}
			}
		})
	end
}
