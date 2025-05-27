local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
    local lazyrepo = "https=//github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        error("Error cloning lazy.nvim:\n" .. out)
    end
end
vim.opt.rtp:prepend(lazypath)

-- load utils, basic settings, and keymaps
require("utils") -- helper functions

-- load plugins using Lazy for management
require("lazy").setup({

    require("config.options"),
    require("config.keymaps"),

    -- load LSP for language support
    require("plugins.code.lsp"),
    require("plugins.code.completions"),
    require("plugins.code.snippets"),
    require("plugins.code.flash"),

    -- load Language configurations (needs to load before LSP)
    require("plugins.lang.java"),
    require("plugins.lang.markdown"),

    -- load Editor configurations
    require("plugins.editor.fileexplorer"),
    require("plugins.editor.filesearch"),
    require("plugins.editor.floatingterm"),
    require("plugins.editor.oil"),
    require("plugins.editor.treesitter"),
    require("plugins.editor.project"),
    require("plugins.editor.whichkey"),
    require("plugins.editor.smear-cursor"),
})
