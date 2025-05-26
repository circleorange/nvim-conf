return {
	"ahmedkhalf/project.nvim",
	config = function()
		require("project_nvim").setup({
			patterns =  { "pom.xml", ".git" },
		})
		require("telescope").load_extension("projects")
	end
}
