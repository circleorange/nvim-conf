return {
  "nvim-java/nvim-java",
  ft = "java",
  dependencies = {
    "neovim/nvim-lspconfig",
    "mfussenegger/nvim-jdtls",
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local cfg          = require("config.lsp")
    local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
    local workspace_dir= vim.fn.expand("~/.workspace/") .. project_name
    local jdtls_cmd    = vim.fn.exepath("jdtls")

    require("java").setup({
      cmd          = { jdtls_cmd },
      workspace    = workspace_dir,
      root_markers = { "pom.xml", ".git", "mvnw", "gradlew" },
      capabilities = cfg.capabilities,
      on_attach    = cfg.on_attach,
      java = {
        eclipse       = { downloadSources = true },
        signatureHelp = { enabled = true },
        contentProvider = { preferred = "fernflower" },
      },
    })
  end,
}
