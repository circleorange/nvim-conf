local cmp_nvim_lsp = require("cmp_nvim_lsp")

local M = {}

-- which servers Mason should ensure are installed
M.ensure_installed = { "lua_ls", "pyright", "jdtls" }

-- enhance capabilities for nvim-cmp
M.capabilities = cmp_nvim_lsp.default_capabilities()

-- common on_attach for all LSP servers
function M.on_attach(client, bufnr)
  local function nmap(keys, fn, desc)
    vim.keymap.set("n", keys, fn, { buffer = bufnr, desc = "LSP: " .. desc })
  end

  nmap("gd", vim.lsp.buf.definition,       "Go to Definition")
  nmap("gD", vim.lsp.buf.declaration,      "Go to Declaration")
  nmap("gr", vim.lsp.buf.references,       "Go to References")
  nmap("gI", vim.lsp.buf.implementation,   "Go to Implementation")
  nmap("K",  vim.lsp.buf.hover,            "Hover Documentation")
  nmap("<leader>rn", vim.lsp.buf.rename,   "Rename")
  nmap("<leader>ca", vim.lsp.buf.code_action, "Code Action")
  nmap("[d", vim.diagnostic.goto_prev,     "Prev Diagnostic")
  nmap("]d", vim.diagnostic.goto_next,     "Next Diagnostic")

  vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help,
    { buffer = bufnr, desc = "Signature Help" })
end

return M
