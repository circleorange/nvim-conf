return {
	-- Plugin to configure Lua languag server, specifically for editing neovim configurations.
	-- Requirements: Uninstall or disable neodev.nvim
	"folke/lazydev.nvim",
	ft = "lua", -- only load for lua files
	opts = {
		library = {
			path = "luvit-meta/library",
			words = { "vim%.uv" },
		},
	},
	config = function()
		vim.lsp.config("lua_ls", {
			filetypes = { "lua" },
			root_markers = { ".luarc.json", ".luarc.jsonc" },
			settings = { Lua = {
				runtime		= { version = { "LuaJIT" } },
				diagnostics = { globals = { "vim", "require" }},
				telemetry	= { enable = false },
			}}
		})
	end
}
