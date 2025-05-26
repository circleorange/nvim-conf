-- Editor
vim.opt.number 			= true
vim.opt.relativenumber 	= true
vim.g.have_nerd_font	= true
vim.opt.guifont			= "Agave Nerd Font"

-- Text, Code
vim.g.autoformat	= false
vim.opt.scrolloff 	= 10 	-- minimum number of lines buffer
vim.opt.cursorline	= false
vim.opt.list		= false	-- show whitespace characters
vim.opt.inccommand	= "split" -- live preview substitutions

-- Indentation
vim.opt.tabstop 	= 4
vim.opt.shiftwidth	= 4
vim.opt.expandtab	= false	-- expand tab to space
vim.opt.smartindent	= true

-- UI
vim.opt.showmode 	= true	-- can disable if already shown on status line
vim.opt.termguicolors	= true
vim.opt.undofile	= true
vim.opt.ignorecase	= true
vim.opt.smartcase	= true
vim.opt.signcolumn	= "yes"

