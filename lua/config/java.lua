-- ~/.config/nvim/lua/config/java.lua

local M = {}

function M.setup()
    local home = os.getenv("HOME") or vim.fn.expand("~")
    -- IMPORTANT: Ensure this path is correct for your system
    local configured_java_home = home .. "/Library/Java/JavaVirtualMachines/corretto-21.0.6/Contents/Home"
    local java_executable = configured_java_home .. "/bin/java"

    if vim.fn.executable(java_executable) == 0 then
        vim.notify(
            "nvim-java: Java executable not found at '" .. java_executable .. "'. " ..
            "Please verify the 'configured_java_home' path in lua/config/java.lua. " ..
            "nvim-java might try to auto-detect another JDK or fail.",
            vim.log.levels.ERROR,
            { title = "nvim-java Error" }
        )
        -- To let nvim-java attempt auto-detection if your path is wrong, you could set:
        -- configured_java_home = nil
    end

    local java_config = {
        -- LSP settings:
        lsp = {
            settings = {
                java = {
                    -- Specify the Java Development Kit (JDK) path for jdtls
                    home = configured_java_home, -- If nil, nvim-java attempts auto-detection

                    -- Other jdtls settings (see nvim-java and jdtls documentation)
                    signatureHelp = { enabled = true },
                    contentProvider = { preferred = "fernflower" }, -- decompiler
                    sources = {
                        organizeImports = {
                            starThreshold = 9999,
                            staticStarThreshold = 9999,
                        },
                    },
                    codeGeneration = {
                        toString = {
                            template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
                        },
                        useBlocks = true,
                    },
                    completion = {
                        favoriteStaticMembers = {
                            "org.assertj.core.api.Assertions.*",
                            "org.junit.jupiter.api.Assertions.*",
                            "java.util.Objects.requireNonNull",
                            "java.util.Objects.requireNonNullElse",
                            "org.mockito.Mockito.*",
                        },
                        filteredTypes = {
                            "java.awt.*", "com.sun.*" -- Example: filter out AWT and internal Sun classes
                        }
                    },
                    -- Configure how 'jdtls' updates build configurations (e.g. for Maven/Gradle)
                    configuration = {
                        updateBuildConfiguration = "automatic", -- "interactive" or "disabled"
                    },
                    -- Red Hat specific settings (jdtls is a Red Hat project)
                    redhat = {
                        telemetry = { enabled = false }, -- Disable telemetry
                    },
                    -- enable progress reports from jdtls
                    extendedClientCapabilities = {
                        progressReportProvider = true,
                    },
                },
            },
            -- You can override on_attach or capabilities here if needed,
            -- otherwise, it uses the global ones from config/lspconfig.lua
            -- and nvim-java adds its own enhancements.
        },

        -- Debugging settings (integrates with nvim-dap)
        dap = {
            hotcodereplace = "auto", -- Options: "manual", "auto", "never"
            listen_localhost_only = true, -- Listen only on localhost for security
            -- java_executable = java_executable, -- DAP can also use this specific Java executable
        },

        -- Test runner integration (e.g. for running Junit tests)
        test = {
            -- enabled = true, -- Set to true to enable nvim-java test features
            -- runner = "neotest", -- if you use neotest with neotest-java
            -- item_prefix = "↪ ", -- Prefix for test items in quickfix/location list
        },

        -- Other nvim-java features
        settings = {
            -- Example: Use Telescope for pickers if installed
            -- pick_main_class_picker = "telescope",
            -- open_project_picker = "telescope",

            -- Whether nvim-java should try to install a JDK if none is found (via Mason)
            jdk_auto_install = false, -- Set to false as you are providing a specific JDK path
        },

        -- UI settings for nvim-java specific elements
        ui = {
            icons_enabled = true, -- Use nvim-web-devicons if available
            -- You can customize icons here if needed
        },
    }

    -- Apply the configuration
    require("java").setup(java_config)

    -- --- Keymaps for nvim-dap (Debugger) ---
    -- These are general DAP keymaps. nvim-java configures the Java debug adapter.
    local map = vim.keymap.set
    local dap_opts = { noremap = true, silent = true, desc = "DAP" }

    map('n', '<leader>db', function() require('dap').toggle_breakpoint() end,
        { desc = "DAP: Toggle Breakpoint", noremap = true })
    map('n', '<leader>dc', function() require('dap').continue() end, { desc = "DAP: Continue", noremap = true })
    map('n', '<leader>do', function() require('dap').step_over() end, { desc = "DAP: Step Over", noremap = true })
    map('n', '<leader>di', function() require('dap').step_into() end, { desc = "DAP: Step Into", noremap = true })
    map('n', '<leader>du', function() require('dap').step_out() end, { desc = "DAP: Step Out", noremap = true })
    map('n', '<leader>dK', function() require('dap.ui.widgets').hover() end,
        { desc = "DAP: Hover Variables", noremap = true })
    map('n', '<leader>dp', function() require('dap.ui.widgets').preview() end,
        { desc = "DAP: Preview Variables", noremap = true })
    map('n', '<leader>dr', function() require('dap').repl.open() end, { desc = "DAP: Open REPL", noremap = true })
    map('n', '<leader>dl', function() require('dap').run_last() end, { desc = "DAP: Run Last", noremap = true })
    map('n', '<leader>dt', function() require('dap').terminate() end, { desc = "DAP: Terminate", noremap = true })

    -- You can add more keymaps for nvim-java specific actions.
    -- Check `nvim-java` documentation for commands like:
    -- :JavaCompile
    -- :JavaOrganizeImports
    -- :JavaUpdateConfig
    -- :JavaUseMainClass (and map it if you like)
    -- :JavaDebugTest (if tests are enabled)

    vim.notify("nvim-java initialized. Using JDK: " .. (configured_java_home or "Auto-detected"), vim.log.levels.INFO,
        { title = "nvim-java" })
end

return M
