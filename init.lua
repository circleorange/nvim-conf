local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        error("Error cloning lazy.nvim:\n" .. out)
    end
end
vim.opt.rtp:prepend(lazypath)

-- load utils, basic settings, and keymaps
require("config.options")
require("config.keymaps")

-- load plugins using Lazy for management
require("lazy").setup({

    -- General Editor
    require("plugins.file_explorer"),
    require("plugins.file_search"),
    require("plugins.terminal"),
    require("plugins.cmdline"),
    require("plugins.project"),
    require("plugins.cursor"),
    require("plugins.misc"),
    require("plugins.git"),

    -- Language-specific
    require("lsp.lua_ls"),
    require("lsp.java"),
	require("lsp.bash"),
	require("lsp.python"),
	require("lsp.c"),
	require("lsp.docker"),
	require("lsp.markdown"),
	require("lsp.latex"),

    -- Code
    require("plugins.completions"),
    require("plugins.treesitter"),
    require("plugins.motions"),
    require("plugins.lsp"),
})
