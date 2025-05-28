local n_map = require("_mapper").nmap
local i_map = require("_mapper").imap
local v_map = require("_mapper").vmap
local x_map = require("_mapper").xmap
local t_map = require("_mapper").tmap
local c_map = require("_mapper").cmap

vim.g._mapleader = " "

n_map("<Leader>w", ":w<Cr>", { desc = "Save File" })
n_map("<Leader>q", ":q!<Cr>", { desc = "Quit Editor" })
n_map("<Leader>x", ":x!<Cr>", { desc = "Save and Quit Editor" })
n_map("<Leader>e", ":e<Cr>", { desc = "File Explorer" })
n_map("<Leader>t", ":t<Cr>", { desc = "Toggle Terminal" })
n_map("<Leader>T", ":ToggleTerm<Cr>", { desc = "Toggle Floating Terminal" })
t_map("<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit Terminal Mode" })


-- file search (Telescope)
n_map("<Leader>ff", ":Telescope find_files<CR>")
n_map("<Leader>fg", ":Telescope live_grep<CR>")
n_map("<Leader>fb", ":Telescope buffers<CR>")
n_map("<Leader>fh", ":Telescope help_tags<CR>")
-- can add: find open buffers, find in recent files

-- window navigation
n_map("<C-h>", "<C-w>h")
n_map("<C-j>", "<C-w>j")
n_map("<C-k>", "<C-w>k")
n_map("<C-l>", "<C-w>l")

-- buffer nav & management
n_map("<S-h>", "<Cmd>bprevious<Cr>", { desc = "Previous Buffer" })
n_map("<S-l>", "<Cmd>bnext<Cr>", { desc = "Next Buffer" })
n_map("<Leader>bb", "<Cmd>e #<Cr>", { desc = "Switch to Other Buffer" })
n_map("<Leader>bd", ":bd<CR>", { desc = "Close buffer" })

-- tabs
n_map("<Leader>tn", ":tabnew<CR>")
n_map("<Leader>to", ":tabonly<CR>")
n_map("<Leader>tc", ":tabclose<CR>")
n_map("<Leader>tm", ":tabmove ")

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
n_map(LEADER.."o", ":Oil .<Cr>", { desc = "Open Oil at $CWD" })
n_map(LEADER.."O", function() 
	require("oil").open_float(vim.fn.expand("%:p:h"))
end, { desc = "Open Oil floating at current file dir" })
n_map("-", ":Oil ..<Cr>", { desc = "Oil quickly jump up" })
