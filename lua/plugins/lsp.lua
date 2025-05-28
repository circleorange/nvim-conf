return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "williamboman/mason.nvim", build = ":MasonUpdate", config = function()
        require("mason").setup()
      end,
    },
    { "williamboman/mason-lspconfig.nvim", dependencies = { "mason.nvim" }, config = function()
        local lsp = require("config.lsp")
        require("mason-lspconfig").setup({
          ensure_installed   = lsp.ensure_installed,
          automatic_installation = true,
        })
      end,
    },
  },
  config = function()
    -- load shared capabilities & on_attach; actual servers live in lua/plugins/lang/
    require("config.lsp")
  end,
}
