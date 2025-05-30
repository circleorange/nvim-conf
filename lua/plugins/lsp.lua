return { 
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "WhoIsSethDaniel/mason-tool-installer.nvim",
        },
        config = function()
            require("config.lsp")
            require("lspconfig").jdtls.setup({})
        end,
    },
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "mason.nvim" },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "jdtls", "lua_ls", "pyright" },
                automatic_installation = true,
            })
        end,
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        dependencies = { "mason.nvim" },
        config = function()
            require("mason-tool-installer").setup({
                -- list ALL the external tools you want Mason to auto-install:
                ensure_installed = {
                    "java-debug-adapter",   -- <─ DAP adapter for Java
                    "stylua",               -- Lua formatter
                    "black",                -- Python formatter
                    "prettier",             -- markdown/js/html formatter
                },
                auto_update = true,
            })
        end,
    },
}
