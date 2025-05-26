local M = {}
local cmp_nvim_lsp = require("cmp_nvim_lsp")

M.ensure_installed = { "lua_ls", "pyright", "jdtls", "bashls", "html", "jsonls", "yamlls" }

M.capabilities = cmp_nvim_lsp.default_capabilities()

function M.on_attach(client, bufnr)
	local function nmap(keys, fn, desc)
		vim.keymap.set("n", keys, fn, { buffer = bufnr, desc = "LSP: "..desc })
	end

	nmap("gd", vim.lsp.buf.definition, "[G]o to [D]efinition")
	nmap("gD", vim.lsp.buf.declaration, "[G]o to [D]eclaraction")
	nmap("gr", vim.lsp.buf.references, "[G]o to [R]eferences")
	nmap("gI", vim.lsp.buf.implementation, "[G]o to [I]mpl")
	nmap("K", vim.lsp.buf.hover, "Hover Documentation")
	nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
	nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
	nmap("[d", vim.diagnostic.goto_prev, "Previous Diagnostic")
	nmap("]d", vim.diagnostic.goto_prev, "Next Diagnostic")

	vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, { buffer = bufnr, desc = "Signature Help" })
end

return M
