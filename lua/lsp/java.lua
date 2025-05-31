return {
	-- Java language support: Spring Boot tools, Diagnostics, Autocompletion, Organise imports, Tests, Debug
	-- Dependencies: Uses nvim-lspconfig to setup jdtls and auto loads plugins.
	-- Cannot be installed alongside nvim-jdtls.
	-- Setup nvim-java before lspconfig; require("java").setup, only then require("lspconfig").jdtls.setup({})
    "nvim-java/nvim-java",
    ft = "java",
	dependencies = {
		"mfussenegger/nvim-dap", -- debug capabilities
	},
    config = function()
		local deps = require("utils.deps")

        require("java").setup({
            root_markers = { "pom.xml", "settings.gradle", "settings.gradle.kts", ".git"},
        })

		vim.lsp.config("jdtls", {})
    end
}
