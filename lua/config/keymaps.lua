local nmap = require("utils").nmap
local imap = require("utils").imap
local vmap = require("utils").vmap
local xmap = require("utils").xmap
local tmap = require("utils").tmap
local cmap = require("utils").cmap

local LEADER 	= "<Leader>"
local CR 		= "<CR>"
local TAB 		= "<TAB>"
local S_TAB 	= "<S_TAB>"
local ESC		= "<Esc>"
local CMD		= "<Cmd>"

vim.g.mapleader = " "

nmap(LEADER .. "w", ":w" .. CR, { desc = "Save File" })
nmap(LEADER .. "q", ":q!" .. CR, { desc = "Quit Editor" })
nmap(LEADER .. "x", ":x!" .. CR, { desc = "Save and Quit Editor" })
nmap(LEADER .. "t", ":t" .. CR, { desc = "Toggle Terminal" })
nmap(LEADER .. "e", ":e" .. CR, { desc = "File Explorer" })

tmap("jj", "<C-\\><C-n>", { desc = "Exit Terminal Mode" })

-- Code, Formatting
vmap("<", "<gv", { desc = "Increase Indentation" })
vmap(">", ">gv", { desc = "Decrease Indentation" })
nmap("<A-j>", CMD.."m .+1"..CR.."==", { desc = "Shift line up" })
nmap("<A-k>", CMD.."m .-2"..CR.."==", { desc = "Shift line down" })
vmap("<A-j>", ":m '>+1"..CR.."gv=gv", { desc = "Shift line up" })
vmap("<A-k>", ":m '>-2"..CR.."gv=gv", { desc = "Shift line down" })

nmap("<S-h>", CMD.."bprevious"..CR, { desc = "Previous Buffer" })
nmap("<S-l>", CMD.."bnext"..CR, { desc = "Next Buffer" })
nmap(LEADER.."bb", CMD.."e #"..CR, { desc = "Switch to Other Buffer" })

