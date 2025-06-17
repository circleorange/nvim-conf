return {
	{
		-- Provides basic, default Neovim LSP client configurations.
		-- Primary interface through which neovim communicates with language serveers.
		-- Core aspect is handling servers not readily available in systems PATH.
		"neovim/nvim-lspconfig",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		config = function()
			local cmp_lsp = require("cmp_nvim_lsp")
			-- Apply default capabilities to all installed language servers
			vim.lsp.config("*", {
				capabilities	= cmp_lsp.capabilities,
				on_attach		= cmp_lsp.on_attach,
			})
		end
	},
	{
		-- LSP Installer and Management (LSP, DAP, linters, formatters)
		-- Commands:
		--		<Cmd>Mason			- Open GUI
		--		<Cmd>MasonUpdate	- Update managed registries
		--		<Cmd>MasonLog		- Open Mason log file in new tab
		"mason-org/mason.nvim",
		build	= ":MasonUpdate",
		opts	= {} -- trigger for lazy.nvim to automatically call setup()
	},
	{
		-- Configurations for LSPs installed by Mason by calling lspconfig.
		-- Automation bridge between mason.nvim and nvim-lspconfig.
		-- Requires mason.nvim and nvim-lspconfig to be fully setup.
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			"mason.nvim",
			"neovim/nvim-lspconfig",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		config = function()
			local lang_servers = {
				"lua_ls",	-- Lua
				"pyright",	-- Python
				"jdtls",	-- Java
				"bashls",	-- Bash
				"lemminx",	-- XML
				"clangd",	-- C/C++
				"marksman",	-- Markdown
				"dockerls", "docker_compose_language_service",
			}
			require("mason-lspconfig").setup({
				ensure_installed        = lang_servers,
				automatic_installation  = true,		-- Install missing LSPs.
				automatic_enable        = true,		-- Automatically enable language servers with `vim.lsp.enable()`.
			})
		end,
	},
	-- Mason Installer for third-party external tools
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "mason.nvim" },
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"java-debug-adapter",   -- DAP adapter for Java
					"stylua",               -- Lua formatter
					"black",                -- Python formatter
					"prettier",             -- markdown/js/html formatter
					"cpptools",
				},
				auto_update = true,
			})
		end,
	},
}
