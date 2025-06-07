return {
    {
		"aaronik/treewalker.nvim",
		opts = {
			highlight			= true,			-- briefly highlight node after jumping to it
			highlight_duration	= 250,
			highlight_gorup		= 'CursorLine', -- colour of the highlight
		},
	},
    {
		"folke/flash.nvim",
		event	= "VeryLazy",
		opts	= {},
		keys	= {
			{ "f", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
		},
	},
}
