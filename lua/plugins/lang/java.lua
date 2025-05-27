return {
    {
        "mfussenegger/nvim-java",
        ft = "java",               -- Load when a Java file is opened
        dependencies = {
            "mfussenegger/nvim-dap", -- For debugging support
        },
        config = function()
            require("config.java").setup() -- We will create this file
        end,
    },
    -- Debug Adapter Protocol (DAP)
    {
        "mfussenegger/nvim-dap",
        -- nvim-java will handle Java-specific DAP configuration.
        -- You might want a separate config file for general DAP settings or keymaps later.
        -- For now, basic DAP keymaps will be in config/java.lua for convenience.
    }
}
