local map = require "utils.mapper".set_map

vim.g.mapleader = " "

-- [D]iagnostics
map("n", "<Leader>do", vim.diagnostic.open_float, "Show Diagnostic popup")

-- [G]it
map("n", "<Leader>gd", ":DiffviewOpen<Cr>", "Open Git Diff View")
vim.keymap.set("n", "<Leader>gD", ":DiffviewClose<Cr>", {desc = "Close Git Diff View"})
vim.keymap.set("n", "<Leader>gh", ":DiffviewFileHistory", {desc = "Open Git history"})
vim.keymap.set("n", "<Leader>gr", ":DiffviewRefresh", {desc = "Refresh Git entries"})
vim.keymap.set("n", "<Leader>go", ":Neogit<Cr>", {desc = "Open Neogit UI"})
vim.keymap.set("n", "<Leader>gs", ":Gitsigns toggle_signs<CR>", {desc = "Toggle Git signs"})
vim.keymap.set("n", "<Leader>gp", ":Gitsigns preview_hunk<CR>", {desc = "Preview Hunk"})
vim.keymap.set("n", "<Leader>gB", ":Gitsigns blame_line<CR>", {desc = "Show in-line Git blame"})

vim.keymap.set("n", "<Leader>eo", function() require'oil'.open_float(vim.fn.expand("%:p:h")) end, { desc = "File explorer (Oil)" })
vim.keymap.set("n", "-", ":Oil ..<Cr>", { desc = "Oil quickly jump up" })

-- Window Management and Navigation
-- Split:
--		`<C-w>v`: Split
--		`<C-w>c`: Close
--		`<C-w>o`: Keep current split
--		`<C-w> hjkl`: Navigate between windows
vim.keymap.set("n", "<S-Up>", "<Cmd>resize +2<Cr>")
vim.keymap.set("n", "<S-Down>", "<Cmd>resize -2<Cr>")
vim.keymap.set("n", "<S-Left>", "<Cmd>vertical resize -2<Cr>")
vim.keymap.set("n", "<S-Right>", "<Cmd>vertical resize +2<Cr>")

-- Code Motions
vim.keymap.set({"n", "v"}, "<C-k>", ":Treewalker Up<Cr>", { silent = true })
vim.keymap.set({"n", "v"}, "<C-j>", ":Treewalker Down<Cr>", { silent = true })
vim.keymap.set({"n", "v"}, "<C-h>", ":Treewalker Left<Cr>", { silent = true })
vim.keymap.set({"n", "v"}, "<C-l>", ":Treewalker Right<Cr>", { silent = true })
vim.keymap.set("n", "<C-S-k>", ":Treewalker SwapUp<Cr>", { silent = true })
vim.keymap.set("n", "<C-S-j>", ":Treewalker SwapDown<Cr>", { silent = true })
vim.keymap.set("n", "<C-S-h>", ":Treewalker SwapLeft<Cr>", { silent = true })
vim.keymap.set("n", "<C-S-l>", ":Treewalker SwapRight<Cr>", { silent = true })

-- Buffer nav & management
vim.keymap.set("n", "<S-h>", "<Cmd>bprevious<Cr>", { desc = "Previous Buffer" })
vim.keymap.set("n", "<S-l>", "<Cmd>bnext<Cr>", { desc = "Next Buffer" })
vim.keymap.set("n", "<Leader>bb", "<Cmd>e #<Cr>", { desc = "Switch to Other Buffer" })
vim.keymap.set("n", "<Leader>bd", ":bd<CR>", { desc = "Close buffer" })

-- Code, Motions, Formatting
-- -- General
map("n", "<leader>cr", vim.lsp.buf.rename, "LSP Rename" )
-- -- Indentation
vim.keymap.set("v", "<", "<gv", { desc = "Increase Indentation" })
vim.keymap.set("v", ">", ">gv", { desc = "Decrease Indentation" })
-- -- Shifting
vim.keymap.set("n", "<A-j>", "<Cmd>m .+1<Cr>==", { desc = "Shift line up" })
vim.keymap.set("n", "<A-k>", "<Cmd>m .-2<Cr>==", { desc = "Shift line down" })
vim.keymap.set("v", "<A-j>", "<Cmd>m '>+1<Cr>gv=gv", { desc = "Shift line up" })
vim.keymap.set("v", "<A-k>", "<Cmd>m '>-2<Cr>gv=gv", { desc = "Shift line down" })
-- -- Trailing whitespace
vim.keymap.set("n", "<Leader>ct", function() require("mini.trailspace").trim() end, { desc = "(Mini) Trim whitespace" })
vim.keymap.set("n", "<Leader>cT", function() require("mini.trailspace").trim_last_lines() end, { desc = "(Mini) Trim lines" })
map("n", "<Leader>um", ":RenderMarkdown toggle<Cr>", "Toggle Markdown Rendering")

vim.keymap.set("n", "<Leader>rl", ":luafile %<Cr>", { desc = "Run current Lua file" })
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit Terminal Mode" })

-- [T]abs
vim.keymap.set("n", "<Leader>tn", ":tabnew<Cr>")
-- map("n", "<Leader>to", ":tabonly<Cr>", {desc = "Keep current tab"})
vim.keymap.set("n", "<Leader>tc", ":tabclose<Cr>")
vim.keymap.set("n", "<Leader>tm", ":tabmove ", { desc = "Move to Tab (specify index)" })

-- [J]ava
vim.keymap.set("n", "<Leader>js", "<Cmd>JavaSettingsChangeRuntime<Cr>", { desc = "Change JDK version" })
vim.keymap.set("n", "<Leader>jc", "<Cmd>JavaBuildBuildWorkspace<Cr>", { desc = "Run full workspace build" })
vim.keymap.set("n", "<Leader>jC", "<Cmd>JavaBuildCleanWorkspace<Cr>", { desc = "Clear the workspace" })
vim.keymap.set("n", "<Leader>jr", "<Cmd>JavaRunnerRunMain<Cr>", { desc = "Run application or selectedc main class" })
vim.keymap.set("n", "<Leader>jR", "<Cmd>JavaRunnerStopMain<Cr>", { desc = "Stop application" })
vim.keymap.set("n", "<Leader>jta", "<Cmd>JavaTestRunCurrentClass<Cr>", { desc = "Run test class in active buffer" })
vim.keymap.set("n", "<Leader>jtt", "<Cmd>JavaTestRunCurrentMethod<Cr>", { desc = "Run test under cursor" })
vim.keymap.set("n", "<Leader>jtr", "<Cmd>JavaTestViewLastReport<Cr>", { desc = "Open last test report in popup window" })
vim.keymap.set("n", "<Leader>jev", "<Cmd>JavaRefactorExtractVariable<Cr>", { desc = "Create variable from value at cursor/ selection" })
