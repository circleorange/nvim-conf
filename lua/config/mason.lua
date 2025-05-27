-- ~/.config/nvim/lua/config/mason.lua

local M = {}

function M.setup_mason()
    require("mason").setup({
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗",
            },
            border = "rounded",
        },
    })
end

function M.setup_mason_lspconfig()
    local lspconfig_utils = require("config.lspconfig") -- Your global on_attach and capabilities

    require("mason-lspconfig").setup({
        -- Ensure Java tools are installed by Mason. nvim-java will use them.
        ensure_installed = {
            "lua_ls",
            "pyright",
            -- Java Tooling
            "jdtls",
            "java-debug-adapter", -- For DAP
            "vscode-java-test", -- For test integration if used by nvim-java or neotest
            "lombok",       -- If your projects use Lombok
        },
        handlers = {
            -- Default handler for LSPs NOT handled by specific configurations below
            function(server_name)
                if server_name == "jdtls" then
                    -- IMPORTANT: Let nvim-java handle the setup for jdtls.
                    -- This function in mason-lspconfig will now effectively do nothing for 'jdtls'.
                    vim.notify("Mason: jdtls LSP setup will be managed by nvim-java.", vim.log.levels.INFO,
                        { title = "LSP Info" })
                    return
                end

                -- Standard setup for other LSPs
                require("lspconfig")[server_name].setup({
                    on_attach = lspconfig_utils.on_attach,
                    capabilities = lspconfig_utils.capabilities(),
                })
            end,

            -- Keep your custom setups for other LSPs if you have them
            ["lua_ls"] = function()
                require("lspconfig").lua_ls.setup({
                    on_attach = lspconfig_utils.on_attach,
                    capabilities = lspconfig_utils.capabilities(),
                    settings = {
                        Lua = {
                            runtime = { version = "LuaJIT" },
                            diagnostics = { globals = { "vim" } },
                            workspace = { library = vim.api.nvim_get_runtime_file("", true), checkThirdParty = false },
                            telemetry = { enable = false },
                        },
                    },
                })
            end,

            ["pyright"] = function()
                require("lspconfig").pyright.setup({
                    on_attach = lspconfig_utils.on_attach,
                    capabilities = lspconfig_utils.capabilities(),
                    settings = {
                        python = {
                            pythonPath = vim.fn.exepath("python3") or vim.fn.exepath("python") or "python",
                            analysis = {
                                autoSearchPaths = true,
                                diagnosticMode = "workspace",
                                useLibraryCodeForTypes = true,
                                typeCheckingMode = "basic",
                            }
                        }
                    }
                })
            end,
            -- The previous detailed custom 'jdtls' handler function is now REMOVED from here.
        },
    })
end

return M
