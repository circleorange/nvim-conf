return {
	-- Syntax highlighting.
	-- Commands:
	-- <Cmd>TSInstall {language} - Install language.
	-- <Cmd>TSUpdate - Upate all installed languages, or specify with {language}.
	-- <Cmd>TSInstallInfo - List all available languages and their installation status.
	-- <Cmd>TSModuleInfo [{module}] - List information about modules state for each file type.
	-- <Cmd>TSEnable {module} - Enable module on every buffer, vice versa for <Cmd>TSDisable.
    "nvim-treesitter/nvim-treesitter",
    branch	= "master",
	lazy	= false,
    build	= ":TSUpdate",
    config	= function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "bash",
                "html",
                "yaml", "json",
                "lua", "luadoc",
                "c", "cpp", "cmake",
                "markdown", "markdown_inline",
                "java",
                "python",
				"dockerfile",
            },
            highlight	= { enable = true },
            indent		= { enable = true },
            textobjects	= { enable = false },
            incremental_selection = { enable = true },
        })
    end,
}
