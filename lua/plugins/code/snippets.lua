return {
	"L3MON4D3/LuaSnip",
	dependencies = {
		"saadparwaiz1/cmp_luasnip"
	},
	config = function()
		require("config.luasnip").setup()
	end
}
