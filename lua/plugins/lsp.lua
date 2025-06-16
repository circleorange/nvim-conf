local deps = require("utils.deps")

return {
	{
		-- Provides basic, default Neovim LSP client configurations.
		-- Primary interface through which neovim communicates with language serveers.
		-- Core aspect is handling servers not readily available in systems PATH.
		"neovim/nvim-lspconfig",
		version = "^1.0.0",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		config = function()
			-- apply default capabilities to all installed language servers
			--vim.lsp.config("*", {
			--	capabilities	= deps.cmp_nvim_lsp.capabilities,
			--	on_attach		= deps.cmp_nvim_lsp.on_attach,
			--})
		end
	},
	{
		-- LSP Installer and Management (LSP, DAP, linters, formatters)
		"williamboman/mason.nvim",
		version	= "^1.0.0",
		build	= ":MasonUpdate",
		opts	= {} -- trigger for lazy.nvim to automatically call setup()
	},
	{
		-- Configurations for LSPs installed by Mason by calling lspconfig.
		-- Automation bridge between mason.nvim and nvim-lspconfig.
		-- Requires mason.nvim and nvim-lspconfig to be fully setup.
		"williamboman/mason-lspconfig.nvim",
		version = "^1.0.0",
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
			deps.mason_lspconfig.setup({
				ensure_installed        = lang_servers,
				automatic_installation  = true,		-- install missing LSPs
				automatic_enable        = true,		-- disable enabling servers by default
			})
		end,
	},
	-- Mason Installer for third-party external tools
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "mason.nvim" },
		config = function()
			deps.mason_tools.setup({
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
