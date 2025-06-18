vim.g.mapleader = " "
local map = vim.keymap.set

-- File [E]xplorer
map("n", "<Leader>eo", ":NvimTreeToggle<Cr>", {desc = "Toggle File Explorer"})
map("n", "<Leader>ef", ":NvimTreeFocus<Cr>", {desc = "Focus on File Explorer"})
map("n", "<Leader>el", ":NvimTreeFindFile<Cr>", {desc = "Find File in File Explorer"})
map("n", "<Leader>ec", ":NvimTreeCollapse<Cr>", {desc = "Collapse File Explorer"})

-- Code [D]iagnostics
map("n", "<Leader>do", ":Trouble diagnostics toggle<Cr>", {desc = "Open Diagnostics (Trouble)"})
map("n", "<Leader>db", ":Trouble diagnostics toggle filter.buf=0<Cr>", {desc = "Buffer Diagnostics (Trouble)"})
map("n", "<Leader>ds", ":Trouble symbols toggle focus=false<Cr>", {desc = "Symbols (Trouble)"})
map("n", "<Leader>dl", ":Trouble lsp toggle focus=false win.position=right<Cr>", {desc = "LSP Definitions / References / ... (Trouble)"})

-- Language Server
local lsp_opts = { noremap = true, silent = true }
map("n", "gd", vim.lsp.buf.definition, vim.tbl_extend("keep", lsp_opts, { desc = "Go to [d]efinition" } ))
map("n", "gD", vim.lsp.buf.declaration, vim.tbl_extend("keep", lsp_opts, { desc = "Go to [D]eclaration" } ))
map("n", "gi", vim.lsp.buf.implementation, vim.tbl_extend("keep", lsp_opts, { desc = "Go to [I]mplementation" }))
map("n", "gr", vim.lsp.buf.references, vim.tbl_extend("keep", lsp_opts, { desc = "Go to [R]eferences" }))

-- Window Management and Navigation 
-- Navigate: <C-w> hjkl
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

-- [F]iles
map("n", "<Leader>fw", "<Cmd>wa!<Cr>", { desc = "Save" })
map("n", "<Leader>fq", "<Cmd>qa!<Cr>", { desc = "Quit" })
map("n", "<Leader>fx", "<Cmd>xa!<Cr>", { desc = "Save and Quit" })
map("n", "<Leader>fe", "<Cmd>e<Cr>", { desc = "File Explorer" })
map("n", "<Leader>ff", ":Telescope find_files<CR>", { desc = "Find File" })
map("n", "<Leader>fg", ":Telescope live_grep<CR>", { desc = "Find in Files" })
map("n", "<Leader>fb", ":Telescope buffers<CR>", { desc = "Find Open Buffer" })
map("n", "<Leader>fh", ":Telescope help_tags<CR>")
map("n", "<Leader>rl", ":luafile %<Cr>", { desc = "Run current Lua file" })

-- [F]ile Explorer in Oil
-- map("n", "<Leader>to", ":Oil .<Cr>", { desc = "Open Oil at $CWD" })
map("n", "<Leader>fo", function() require("oil").open_float(vim.fn.expand("%:p:h")) end, { desc = "Open Oil File Explorer at CWD" })
map("n", "-", ":Oil ..<Cr>", { desc = "Oil quickly jump up" })

-- [T]erminal
-- map("n", ":", "<Cmd>FineCmdline<Cr>", { noremap = true, desc = "Open Floating Command Line" })
map("n", "<Leader>tt", "<Cmd>ToggleTerm direction=float<Cr>", { desc = "Toggle Floating Terminal" })
map("n", "<Leader>th", "<Cmd>ToggleTerm<Cr>", { desc = "Toggle Terminal" })
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit Terminal Mode" })

-- [T]abs
map("n", "<Leader>tn", ":tabnew<Cr>")
map("n", "<Leader>to", ":tabonly<Cr>")
map("n", "<Leader>tc", ":tabclose<Cr>")
map("n", "<Leader>tm", ":tabmove ", { desc = "Move to Tab (specify index)" })

-- [G]it
map("n", "<Leader>go", ":Neogit<Cr>", {desc = "Open Neogit UI"})
map("n", "<Leader>gs", ":Gitsigns toggle_signs<CR>")
map("n", "<Leader>gp", ":Gitsigns preview_hunk<CR>")
map("n", "<Leader>gb", ":Gitsigns blame_line<CR>")

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
