return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",
  run = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "bash", "lua", "luadoc", "c", "markdown", "markdown_inline", "html", "java", "python", "yaml", "json" },
      highlight        = { enable = true },
      indent           = { enable = true },
      incremental_selection = { enable = true },
      textobjects      = { enable = true },
    })
  end,
}
