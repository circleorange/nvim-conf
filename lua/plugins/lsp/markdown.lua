return {
	-- LSP support for Markdown using marksman
	{
		"neovim/nvim-lspconfig",
        enabled = false,
		ft = {"markdown"},
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			require "marksman".setup({})
		end
	},
	{
        -- Markdown browser live preview
        -- Commands:
        --      :RenderMarkdown toggle - Toggle state (Enable/ Disable) of the plugin.
		"MeanderingProgrammer/render-markdown.nvim",
        dependencies = { {"echasnovski/mini.icons", opts = {}} },
        config = function()
            require "render-markdown".setup {
                -- Recommended configuration for completions.
                completions = { lsp = {enabled = true}}
            }
        end -- <<< config
	},
}
