local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
	local lazyrepo = "https=//github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath, })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end
vim.opt.rtp:prepend(lazypath)

-- load utils, basic settings, and keymaps
require("utils") -- helper functions
require("config.options")
require("config.keymaps")

-- load plugins using Lazy for management
require("lazy").setup({
	-- require("plugins.editor."),

	-- load Editor configurations
	require("plugins.editor.fileexplorer"),
	require("plugins.editor.filesearch"),
	require("plugins.editor.floatingterm"),
	-- require("plugins.editor.whichkey"),

	-- load Language configurations
	-- require("plugins.lang.java"),
	-- require("plugins.lang.markdown"),
})

