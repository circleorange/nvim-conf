return {
	-- Configurations for LSPs installed by Mason by calling lspconfig.
	-- Automation bridge between mason.nvim and nvim-lspconfig.
	-- Requires mason.nvim and nvim-lspconfig to be fully setup.
	"mason-org/mason-lspconfig.nvim",
	dependencies = {
		-- UI Interface for manual LSP Install and Management (LSP, DAP, linters, formatters).
		"mason-org/mason.nvim",
		-- Basic, default LSP client configurations (only LSP, does not install DAPs, linters, formatters).
		-- Primary interface through which neovim communicates with language serveers.
		-- Core aspect is handling servers not readily available in systems PATH.
		"neovim/nvim-lspconfig",
		-- Manages all tools Mason can install (LSP, DAP, linters, formatters).
		-- Supports removal unused tools via `auto_remove = true`.
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- Initialise all language servers with the same initial configurations.
		local extended_capabilities = require("cmp_nvim_lsp").default_capabilities()
		vim.lsp.config("*", {
			capabilities = extended_capabilities,
		})
		require("mason").setup()
		local lang_servers = {
			"lua_ls",	-- Lua
			"pyright",	-- Python (can replace with ruff & basedpyright)
			--"jdtls",	-- Java
			--"bashls",	-- Bash
			--"lemminx",	-- XML
			--"clangd",	-- C/C++
			--"marksman",	-- Markdown
			--"dockerls", "docker_compose_language_service",
		}
		require("mason-lspconfig").setup {
			ensure_installed = lang_servers,
		}

		local lang_tools = {
			--"java-debug-adapter",   -- DAP adapter for Java
			--"stylua",               -- Lua formatter
			--"black",                -- Python formatter
			--"prettier",             -- markdown/js/html formatter
			--"cpptools",
		}
		require("mason-tool-installer").setup {
			ensure_installed	= lang_tools,
			auto_remove			= true
		}
	end, -- config
}
