return {
	-- LSP support for Markdown using marksman
	{
		"neovim/nvim-lspconfig",
		ft = {"markdown"},
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			require("marksman").setup({})
		end
	},
	-- Markdown browser live preview
	{
		"iamcco/markdown-preview.nvim",
		ft		= {"markdown"},
		cmd		= {"MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop"},
		build	= function() vim.fn["mkdp#util#install"]() end,
	},
}
