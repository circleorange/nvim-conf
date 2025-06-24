local opt = vim.opt

-- General
opt.guifont = "Agave Nerd Font"
opt.mouse = "a"               -- Enable mouse support in all modes
opt.clipboard = "unnamedplus" -- Use system clipboard
opt.swapfile = false          -- Disable swap files
opt.backup = false            -- Disable backup files
opt.undofile = true           -- Enable persistent undo

-- Appearance
opt.number = true         -- Show line numbers
opt.relativenumber = true -- Show relative line numbers
opt.cursorline = true     -- Highlight the current line
opt.termguicolors = true  -- Enable true color support
opt.signcolumn = "yes"    -- Always show the sign column, otherwise it would shift the text
opt.scrolloff = 8         -- Minimal number of screen lines to keep above and below the cursor
opt.sidescrolloff = 8     -- Minimal number of screen columns to keep to the left and right of the cursor
opt.showmode = false      -- Don't show mode since it's in the status line

-- Tabs and Indentation
opt.tabstop = 4        -- Number of spaces that a <Tab> in the file counts for
opt.softtabstop = 4    -- Number of spaces that a <Tab> counts for when inserting a <Tab>
opt.shiftwidth = 4     -- Number of spaces to use for each step of (auto)indent
opt.expandtab = true   -- Use spaces instead of tabs
opt.autoindent = true  -- Copy indent from current line when starting a new line
opt.smartindent = true -- Make indenting smart

-- Search
opt.hlsearch = true   -- Highlight all matches on search
opt.incsearch = true  -- Show search results incrementally
opt.ignorecase = true -- Ignore case in search patterns
opt.smartcase = true  -- Override 'ignorecase' if the search pattern contains uppercase letters

-- Behavior
opt.wrap = false      -- Do not wrap lines
opt.splitright = true -- When splitting vertically, new window goes to the right
opt.splitbelow = true -- When splitting horizontally, new window goes to the bottom
opt.autoread = true   -- Automatically re-read files if modified outside of Neovim

-- Performance
opt.updatetime = 2000 -- Duration to trigger cursor hover event (default is 4000ms)
-- opt.timeoutlen = 500 -- Time in milliseconds to wait for a mapped sequence to complete

