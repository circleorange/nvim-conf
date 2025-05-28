return {
  "nvim-treesitter/nvim-treesitter",
  run = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "java","lua","python","bash","json","yaml","markdown" },
      highlight        = { enable = true },
      indent           = { enable = true },
      incremental_selection = { enable = true },
      textobjects      = { enable = true },
    })
  end,
}
