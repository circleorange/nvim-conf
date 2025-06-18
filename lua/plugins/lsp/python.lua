return {
    {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"mfussenegger/nvim-dap",
	},
	config = function()
		-- require("lspconfig").pyright.setup({
		vim.lsp.config("pyright", {
			-- Defaults:
			-- cmd			= {"pyright-langserver", "--stdio"}
			-- root_files	= {"pyproject.toml", "setup.py", "requirements.txt", ".git"}
			-- filetypes	= {"python"}
			-- Enabled: single_file_support
			settings = { python = { analysis = {
					autoSearchPaths			= true,
					useLibraryCodeForTypes	= true,
					diagnosticMode			= "workspace",
			}}}
		})
	end -- <<< config
    },
    {
        -- Plugin to execute Python code interactively with Jupyter (.ipynb)
        -- Alternatives: Vigemus/iron.nvim
        --
        "dccsillag/magma-nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        cmd = {"MagmaInit", "MagmaDeinit"}, -- lazy-load on these commands
        config = function ()
            require "magma".setup {
                automatically_open_output   = true,     -- Open popup after evaluation
                cell_highlight_group        = "visual", -- Highlight current cell buffer
                output_window_borders       = true,     -- Show borders around output window
                wrap_output                 = true,     -- Wrap long output lines
                image_provider              = "none",   -- Image rendering
            }
            local map = require "utils.mapper".set_map
            map("n", "<Leader>pi", ":MagmaInit<Cr>", "(Magma) Initialise Kernel")
            map("n", "<Leader>ps", ":MagmaDeinit<Cr>", "(Magma) Stop Kernel")
            map("n", "<Leader>pr", ":MagmaRestart!<Cr>", "(Magma) Restart Kernel & Clear Outputs")
            map("n", "<Leader>pe", ":MagmaEvaluateOperator<Cr>", "(Magma) Run cell operator")
            map("n", "<Leader>pl", ":MagmaEvaluateLine<Cr>", "(Magma) Run current line")
            map("n", "<Leader>pE", ":MagmaEvaluateVisual<Cr>", "(Magma) Run visual selection")
            map("n", "<Leader>pi", ":MagmaReevaluateCell<Cr>", "(Magma) Re-run cell")
            map("n", "<Leader>po", ":MagmaShowOutput<Cr>", "(Magma) Show Outputs")
        end
    }
}
