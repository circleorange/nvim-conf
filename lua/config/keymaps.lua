local n_map = require("config.mapper").nmap
local i_map = require("config.mapper").imap
local v_map = require("config.mapper").vmap
local x_map = require("config.mapper").xmap
local t_map = require("config.mapper").tmap
local c_map = require("config.mapper").cmap

vim.g.mapleader = " "
local map = vim.keymap.set

map("n", "<Leader>w", ":w<Cr>", { desc = "Save File" })
map("n", "<Leader>q", ":q!<Cr>", { desc = "Quit Editor" })
map("n", "<Leader>x", ":x!<Cr>", { desc = "Save and Quit Editor" })
map("n", "<Leader>e", ":e<Cr>", { desc = "File Explorer" })
map("n", "<Leader>T", ":ToggleTerm<Cr>", { desc = "Toggle Floating Terminal" })
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit Terminal Mode" })


-- file search (Telescope)
map("n", "<Leader>ff", ":Telescope find_files<CR>", { desc = "Find File" })
map("n", "<Leader>fg", ":Telescope live_grep<CR>", { desc = "Search in Files" })
map("n", "<Leader>fb", ":Telescope buffers<CR>", { desc = "Find Buffer" })
map("n", "<Leader>fh", ":Telescope help_tags<CR>")
-- can add: find open buffers, find in recent files

-- Code Motions
map({"n", "v"}, "<C-k>", "<Cmd>Treewalker Up<Cr>", { silent = true })
map({"n", "v"}, "<C-j>", "<Cmd>Treewalker Down<Cr>", { silent = true })
map({"n", "v"}, "<C-h>", "<Cmd>Treewalker Left<Cr>", { silent = true })
map({"n", "v"}, "<C-l>", "<Cmd>Treewalker Right<Cr>", { silent = true })

map("n", "<C-S-k>", "<Cmd>Treewalker SwapUp<Cr>", { silent = true })
map("n", "<C-S-j>", "<Cmd>Treewalker SwapDown<Cr>", { silent = true })
map("n", "<C-S-h>", "<Cmd>Treewalker SwapLeft<Cr>", { silent = true })
map("n", "<C-S-l>", "<Cmd>Treewalker SwapRight<Cr>", { silent = true })

-- window navigation (<C-w>hjkl)

-- buffer nav & management
map("n", "<S-h>", "<Cmd>bprevious<Cr>", { desc = "Previous Buffer" })
map("n", "<S-l>", "<Cmd>bnext<Cr>", { desc = "Next Buffer" })
map("n", "<Leader>bb", "<Cmd>e #<Cr>", { desc = "Switch to Other Buffer" })
map("n", "<Leader>bd", ":bd<CR>", { desc = "Close buffer" })

-- tabs
map("n", "<Leader>tn", ":tabnew<Cr>")
map("n", "<Leader>to", ":tabonly<Cr>")
map("n", "<Leader>tc", ":tabclose<Cr>")
map("n", "<Leader>tm", ":tabmove ", { desc = "Move to Tab (specify index)" })

-- Code, Formatting
v_map("<", "<gv", { desc = "Increase Indentation" })
v_map(">", ">gv", { desc = "Decrease Indentation" })

n_map("<A-j>", "<Cmd>m .+1<Cr>==", { desc = "Shift line up" })
n_map("<A-k>", "<Cmd>m .-2<Cr>==", { desc = "Shift line down" })
v_map("<A-j>", ":m '>+1<Cr>gv=gv", { desc = "Shift line up" })
v_map("<A-k>", ":m '>-2<Cr>gv=gv", { desc = "Shift line down" })

-- toggle quickfix and diagnostic lists
n_map("<Leader>qf", ":copen<CR>")
n_map("<Leader>qd", ":lnext<CR>")   -- next diagnostic
n_map("<Leader>qD", ":lprev<CR>")   -- prev diagnostic

-- git signs
n_map("<Leader>gs", ":Gitsigns toggle_signs<CR>")
n_map("<Leader>gp", ":Gitsigns preview_hunk<CR>")
n_map("<Leader>gb", ":Gitsigns blame_line<CR>")


-- Oil
n_map("<Leader>o", ":Oil .<Cr>", { desc = "Open Oil at $CWD" })
n_map("<Leader>O", function() 
	require("oil").open_float(vim.fn.expand("%:p:h"))
end, { desc = "Open Oil floating at current file dir" })
n_map("-", ":Oil ..<Cr>", { desc = "Oil quickly jump up" })
