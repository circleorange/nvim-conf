return {
	-- VS Code -like snippet collection.
	{
		"rafamadriz/friendly-snippets"
	},
	-- Completion Engine.
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter", -- Load completions when entering Insert mode for efficiency
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",			-- LSP source for nvim-cmp
			"hrsh7th/cmp-buffer",			-- Buffer words source
			"hrsh7th/cmp-path",				-- File path source
			"L3MON4D3/LuaSnip",				-- Snippet engine (required by nvim-cmp for snipper expansions)
			"saadparwaiz1/cmp_luasnip",		-- Snipper source 
		},
		config = function()
			local cmp		= require "cmp"
			local luasnip	= require "luasnip"
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				snippet = {
					expand = function(args) luasnip.lsp_expand(args.body) end, -- Use LuaSnip to expand snippets
				},
				mapping = cmp.mapping.preset.insert({
					["<C-Space>"]	= cmp.mapping.complete(),
					["<CR>"]		= cmp.mapping.confirm({ select = true }),
					["<Tab>"]		= cmp.mapping(function(fallback)
						if cmp.visible() then cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then luasnip.expand_or_jump()
						else fallback() end
					end, { "i","s" }),
					["<S-Tab>"]    = cmp.mapping(function(fallback)
						if cmp.visible() then cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then luasnip.jump(-1)
						else fallback() end
					end, { "i","s" }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
					{name = "lazydev", group_index = 0}, -- Group index 0 to skip loading LuaLS completions
				}),
			})
		end,
	},
}
