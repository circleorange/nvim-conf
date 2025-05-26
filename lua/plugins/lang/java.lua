return {
	"nvim-java/nvim-java",
	ft = "java",
	dependencies = {
		"neovim/nvim-lspconfig", -- LSP bridge
		"mfussenegger/nvim-jdtls", -- actual jdtls client adapter
		"nvim-lua/plenary.nvim" -- utility functions
	},
	config = function()
			
		-- determine project name and workspace directory
		local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
		local workspace_dir = vim.fn.expand("~/.workspace/") .. project_name
		local jdtls_cmd = vim.fn.exepath("jdtls")
		local lsp_conf = require("config.lsp")
		local java_home = vim.fn.expand("~/Library/Java/JavaVirtualMachines/corretto-21.0.6/Contents/Home")

		require("java").setup({
			java = {
				eclipse = { downloadSources = true },
				signatureHelp = { enabled = true },
				contentProvider = { preferred = "fernflower" }
			},
			root_markers = { "pom.xml", ".git", "mvnw", "gradlew" },
			cmd = { java_home.."bin/java" },
			workspace = workspace_dir,

			capabilities = lsp_conf.capabilities,
			on_attach = lsp_conf.on_attach,
		})
	end -- end of config
}
