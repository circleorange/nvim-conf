return {
	-- Diagnostics, References, Telescope Results, Quickfix
	--
	"folke/trouble.nvim",
	opts	= {},
	cmd		= "Trouble",
	key		= {
		{"<Leader>xx", "<Cmd>Trouble diagnostics toggle<Cr>", desc = "Diagnostics (Trouble)"},
		{"<Leader>xX", "<Cmd>Trouble diagnostics toggle filter.buf=0<Cr>", desc = "Buffer Diagnostics (Trouble)"},
		{"<Leader>cs", "<Cmd>Trouble symbols toggle focus=false<Cr>", desc = "Symbols (Trouble)"},
		{"<Leader>cl", "<Cmd>Trouble lsp toggle focus=false win.position=right<Cr>", desc = "LSP Definitions / References / ... (Trouble)"},
		{"<Leader>xL", "<Cmd>Trouble loclist toggle<Cr>", desc = "Location List (Trouble)"},
		{"<Leader>xQ", "<Cmd>Trouble qflist toggle<Cr>", desc = "Quickfix List (Trouble)"},
	},
}
