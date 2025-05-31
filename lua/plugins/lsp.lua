local deps
local servers = { "lua_ls", "pyright", "jdtls" }

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
			-- apply default capabilities to all installed language servers
			vim.lsp.config("*", {
				capabilities	= deps.cmp_nvim_lsp.capabilities,
				on_attach		= deps.cmp_nvim_lsp.on_attach,
			})
		end
	},
	-- LSP Installer and Management (LSP, DAP, linters, formatters)
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		opts = {} -- trigger for lazy.nvim to automatically call setup()
	},
	-- Configurations for LSPs installed by Mason by calling lspconfig.
	-- Automation bridge between mason.nvim and nvim-lspconfig.
	-- Requires mason.nvim and nvim-lspconfig to be fully setup.
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"mason.nvim",
			"neovim/nvim-lspconfig",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		config = function()
			deps.mason_lspconfig.setup({
				ensure_installed        = servers,
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
			deps = require("utils.deps")
			deps.mason_tools.setup({
				-- external tools for mason to install
				ensure_installed = {
					"java-debug-adapter",   -- DAP adapter for Java
					"stylua",               -- Lua formatter
					"black",                -- Python formatter
					"prettier",             -- markdown/js/html formatter
				},
				auto_update = true,
			})
		end,
	},
}
