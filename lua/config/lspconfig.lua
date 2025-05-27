-- ~/.config/nvim/lua/config/lspconfig.lua

local M = {}

function M.setup()
    -- This module will be required by mason.lua to get on_attach and capabilities
end

-- This function will be called for each LSP server that attaches to a buffer
M.on_attach = function(client, bufnr)
    local map = vim.keymap.set
    -- Common options for LSP keymaps
    local opts = { noremap = true, silent = true, buffer = bufnr }

    -- Enable completion triggered by <c-x><c-o>
    -- vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    map("n", "gD", vim.lsp.buf.declaration, opts)                   -- Go to Declaration
    map("n", "gd", vim.lsp.buf.definition, opts)                    -- Go to Definition
    map("n", "K", vim.lsp.buf.hover, opts)                          -- Show Hover information
    map("n", "gi", vim.lsp.buf.implementation, opts)                -- Go to Implementation
    map("n", "<leader>sh", vim.lsp.buf.signature_help, opts)        -- Show Signature Help
    map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)  -- Add Workspace Folder
    map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts) -- Remove Workspace Folder
    map("n", "<leader>wl", function()                               -- List Workspace Folders
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    map("n", "<leader>D", vim.lsp.buf.type_definition, opts)     -- Go to Type Definition
    map("n", "<leader>rn", vim.lsp.buf.rename, opts)             -- Rename Symbol
    map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- Code Actions
    map("n", "gr", vim.lsp.buf.references, opts)                 -- Show References
    map("n", "<leader>f", function()                             -- Format Document
        vim.lsp.buf.format({ async = true })
    end, opts)

    -- Highlight symbols under cursor (optional)
    if client.server_capabilities.documentHighlightProvider then
        vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
        vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            group = "lsp_document_highlight",
            buffer = bufnr,
            callback = vim.lsp.buf.document_highlight,
        })
        vim.api.nvim_create_autocmd("CursorMoved", {
            group = "lsp_document_highlight",
            buffer = bufnr,
            callback = vim.lsp.buf.clear_references,
        })
    end

    -- Optional: Auto-format on save (if server supports formatting)
    -- if client.server_capabilities.documentFormattingProvider then
    --   vim.api.nvim_create_autocmd("BufWritePre", {
    --     group = vim.api.nvim_create_augroup("LspFormatOnSave_" .. bufnr, { clear = true }),
    --     buffer = bufnr,
    --     callback = function() vim.lsp.buf.format({ bufnr = bufnr, timeout_ms = 500 }) end
    --   })
    -- end
end

-- Get capabilities from nvim-cmp
-- Make sure `cmp_nvim_lsp` is loaded when this is called, or defer it.
-- For simplicity here, we assume it will be available when mason-lspconfig runs.
M.capabilities = function()
    return require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
end

return M
