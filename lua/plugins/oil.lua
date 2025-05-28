return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("oil").setup({
      use_default_keymaps = false,
      keymaps = {
        ["<CR>"]  = "actions.select",
        ["-"]     = "actions.parent",
        ["<C-h>"] = "actions.toggle_hidden",
        ["<C-r>"] = "actions.refresh",
        ["?"]     = "actions.show_help",
      },
    })
  end,
}
