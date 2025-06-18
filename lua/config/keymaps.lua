local set_map = require "utils.mapper".set_map
local map = vim.keymap.set

vim.g.mapleader = " "

-- [D]iagnostics
set_map("n", "<Leader>do", vim.diagnostic.open_float, "Show Diagnostic popup")

-- [G]it
map("n", "<Leader>gd", ":DiffviewOpen<Cr>", {desc = "Open Git Diff View"})
map("n", "<Leader>gD", ":DiffviewClose<Cr>", {desc = "Close Git Diff View"})
map("n", "<Leader>gh", ":DiffviewFileHistory", {desc = "Open Git history"})
map("n", "<Leader>gr", ":DiffviewRefresh", {desc = "Refresh Git entries"})
map("n", "<Leader>go", ":Neogit<Cr>", {desc = "Open Neogit UI"})
map("n", "<Leader>gs", ":Gitsigns toggle_signs<CR>", {desc = "Toggle Git signs"})
map("n", "<Leader>gp", ":Gitsigns preview_hunk<CR>", {desc = "Preview Hunk"})
map("n", "<Leader>gB", ":Gitsigns blame_line<CR>", {desc = "Show in-line Git blame"})

map("n", "<Leader>eo", function() require'oil'.open_float(vim.fn.expand("%:p:h")) end, { desc = "File explorer (Oil)" })
map("n", "-", ":Oil ..<Cr>", { desc = "Oil quickly jump up" })

-- Window Management and Navigation 
-- Split: 
--		`<C-w>v`: Split
--		`<C-w>c`: Close
--		`<C-w>o`: Keep current split
--		`<C-w> hjkl`: Navigate between windows
map("n", "<S-Up>", "<Cmd>resize +2<Cr>")
map("n", "<S-Down>", "<Cmd>resize -2<Cr>")
map("n", "<S-Left>", "<Cmd>vertical resize -2<Cr>")
map("n", "<S-Right>", "<Cmd>vertical resize +2<Cr>")

-- Code Motions
map({"n", "x", "o"}, "<C-f>", ":lua require'flash'.jump()<Cr>", {desc = "Flash Jump"})
map({"n", "v"}, "<C-k>", ":Treewalker Up<Cr>", { silent = true })
map({"n", "v"}, "<C-j>", ":Treewalker Down<Cr>", { silent = true })
map({"n", "v"}, "<C-h>", ":Treewalker Left<Cr>", { silent = true })
map({"n", "v"}, "<C-l>", ":Treewalker Right<Cr>", { silent = true })
map("n", "<C-S-k>", ":Treewalker SwapUp<Cr>", { silent = true })
map("n", "<C-S-j>", ":Treewalker SwapDown<Cr>", { silent = true })
map("n", "<C-S-h>", ":Treewalker SwapLeft<Cr>", { silent = true })
map("n", "<C-S-l>", ":Treewalker SwapRight<Cr>", { silent = true })

-- Buffer nav & management
map("n", "<S-h>", "<Cmd>bprevious<Cr>", { desc = "Previous Buffer" })
map("n", "<S-l>", "<Cmd>bnext<Cr>", { desc = "Next Buffer" })
map("n", "<Leader>bb", "<Cmd>e #<Cr>", { desc = "Switch to Other Buffer" })
map("n", "<Leader>bd", ":bd<CR>", { desc = "Close buffer" })

-- Code, Formatting
map("v", "<", "<gv", { desc = "Increase Indentation" })
map("v", ">", ">gv", { desc = "Decrease Indentation" })
map("n", "<A-j>", "<Cmd>m .+1<Cr>==", { desc = "Shift line up" })
map("n", "<A-k>", "<Cmd>m .-2<Cr>==", { desc = "Shift line down" })
map("v", "<A-j>", "<Cmd>m '>+1<Cr>gv=gv", { desc = "Shift line up" })
map("v", "<A-k>", "<Cmd>m '>-2<Cr>gv=gv", { desc = "Shift line down" })

map("n", "<Leader>rl", ":luafile %<Cr>", { desc = "Run current Lua file" })


map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit Terminal Mode" })

-- [T]abs
map("n", "<Leader>tn", ":tabnew<Cr>")
-- map("n", "<Leader>to", ":tabonly<Cr>", {desc = "Keep current tab"})
map("n", "<Leader>tc", ":tabclose<Cr>")
map("n", "<Leader>tm", ":tabmove ", { desc = "Move to Tab (specify index)" })

-- [J]ava
map("n", "<Leader>js", "<Cmd>JavaSettingsChangeRuntime<Cr>", { desc = "Change JDK version" })
map("n", "<Leader>jc", "<Cmd>JavaBuildBuildWorkspace<Cr>", { desc = "Run full workspace build" })
map("n", "<Leader>jC", "<Cmd>JavaBuildCleanWorkspace<Cr>", { desc = "Clear the workspace" })
map("n", "<Leader>jr", "<Cmd>JavaRunnerRunMain<Cr>", { desc = "Run application or selectedc main class" })
map("n", "<Leader>jR", "<Cmd>JavaRunnerStopMain<Cr>", { desc = "Stop application" })
map("n", "<Leader>jta", "<Cmd>JavaTestRunCurrentClass<Cr>", { desc = "Run test class in active buffer" })
map("n", "<Leader>jtt", "<Cmd>JavaTestRunCurrentMethod<Cr>", { desc = "Run test under cursor" })
map("n", "<Leader>jtr", "<Cmd>JavaTestViewLastReport<Cr>", { desc = "Open last test report in popup window" })
map("n", "<Leader>jev", "<Cmd>JavaRefactorExtractVariable<Cr>", { desc = "Create variable from value at cursor/ selection" })

