-- Bootstrap lazy.vim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system(
	    {"git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath}
    )
    if vim.v.shell_error ~= 0 then
        error("Error cloning lazy.nvim:\n" .. out)
    end
end
vim.opt.rtp:prepend(lazypath)

-- load utils, basic settings, and keymaps
require "config.options"
require "config.keymaps"

-- Load plugins using lazy.nvim package manager.
-- 
-- Commands:
--		- <Cmd>Lazy			- Show managed plugin information.
--		- <Cmd>Lazy install	- Install missing plugins, does not update existing ones.
--		- <Cmd>Lazy update	- Update plugins that are already installed.
--		- <Cmd>Lazy sync	- Both install missing plugins, update all, and clean any unused plugins.
--
require("lazy").setup({

    -- General Editor
    require("plugins.file_explorer"),
    require("plugins.file_search"),
    require("plugins.terminal"),
    -- require("plugins.cmdline"),
    -- require("plugins.project"),
    require("plugins.cursor"),
    -- require("plugins.misc"),
    -- require("plugins.git"),
    require("plugins.styles.theme"),

    -- Language Server Protocols (LSP)
    require "plugins.lsp.lua_ls",
	--require "plugins.lsp.python",
    -- require("lsp.java"), -- Disabled due to issues with Mason 2.0
	-- require("lsp.bash"),
	-- require("lsp.c"),
	-- require("lsp.docker"),
	-- require("lsp.markdown"),
	-- require("lsp.latex"),

    -- Code
    require "plugins.treesitter",
    require "plugins.completions",
    require "plugins.motions",
    require "plugins.lsp.lsp_config", -- Must run after LSP
})
vim.cmd.colorscheme("vague")
