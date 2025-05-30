return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			"folke/neodev.nvim",

		},
		config = function()
			require("config.lsp")
			require("neodev").setup()
			require("lspconfig").jdtls.setup({})
		end,
	},
	-- LSP Registry and UI (management and installation of LSPs)
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		config = function()
			require("mason").setup()
		end,
	},
	-- Configurations for LSPs installed by Mason by calling lspconfig.
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"mason.nvim",
			"neovim/nvim-lspconfig",
		},
		config = function()
			local lsp_options   = require("config.lsp")
			local servers       = lsp_options.ensure_installed

			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed        = servers,
				automatic_installation  = true,		-- install missing LSPs
				automatic_enable        = true,		-- disable enabling servers by default
			})

			vim.lsp.config["lua_ls"] = {
				cmd = { "lua-language-server" },    -- start LSP
				filetypes = { "lua" },
				root_markers = { ".luarc.json", ".luarc.jsonc" },
				settings = {
					Lua = {
						runtime = { version = { "LuaJIT" } }
					}
				},
			}
			vim.lsp.enable("lua_ls")

			local function enable_server(server_name)
				local server = servers[server_name] or {}

				server.capabilities = vim.tbl_deep_extend("force", {}, lsp_options.capabilities or {})

				vim.lsp.config[server_name].setup({
					capabilities    = lsp_options.capabilities,
					on_attach       = lsp_options.on_attach,
				})

				vim.lsp.enable(name)
			end
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "mason.nvim" },
		config = function()
			require("mason-tool-installer").setup({
				-- list ALL the external tools you want Mason to auto-install:
				ensure_installed = {
					"java-debug-adapter",   -- <─ DAP adapter for Java
					"stylua",               -- Lua formatter
					"black",                -- Python formatter
					"prettier",             -- markdown/js/html formatter
				},
				auto_update = true,
			})
		end,
	},
}
