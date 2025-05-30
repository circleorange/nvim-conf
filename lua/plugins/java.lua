return {
    "nvim-java/nvim-java",
    ft = "java",
    config = function()
        require("java").setup({
            root_markers = { "pom.xml", "settings.gradle", "settings.gradle.kts", ".git"},
        })
    end,
}
