return
    {
        {
            -- Markdown browser live preview
            -- Commands:
            --      :RenderMarkdown toggle - Toggle state (Enable/ Disable) of the plugin.
            "MeanderingProgrammer/render-markdown.nvim",
            dependencies = { {"echasnovski/mini.icons", opts = {}} },
            config = function()
                require "render-markdown".setup {
                    -- Recommended configuration for completions.
                    completions = { lsp = {enabled = true}}
                }
            end -- <<< config
        },
        {
            -- Plugin for writing and navigating Obsidian vaults.
            -- Features: Completion, Navigation, Images, Syntax highlighting, Concealing, References, Tages.
            --
            -- Commands:
            --      :ObsidianOpen {query}       - Open note in Obsidian app.
            --      :ObsidianNew {title}        - Create new note.
            --      :ObsidianQuickSwitch        - Quickly switch to (or open) another note in the vault.
            --      :ObsidianTags {tag ...}     - Open Picker with list of all given tags.
            --      :ObsidianSearch {query}     - Search for (or create) notes in the vault.
            --      :ObsidianBacklinks          - Open Picker with references to current buffer.
            --      :ObsidianLink {query}       - Link an inline visual selection of text to note.
            --      :ObsidianLinkNew {title}    - Create new note and link it to an inline visual selection of text.
            --      :ObsidianLinks              - Open Picker with links within current buffer.
            --      :ObsidianFollowLink {opt}   - Follow note reference under cursor, opt = {vsplit|hsplit}.
            --      :ObsidianWorkspace {name}   - Switch to another workspace.
            --      :ObsidianToggleCheckbox     - Toggle checkbox.
            --      :ObsidianTOC                - Open Picker with table of contents.
            --
            "epwalsh/obsidian.nvim",
            version     = "*",
            lazy        = true,
            ft          = "markdown",
            dependencies = {
                "nvim-lua/plenary.nvim",            -- Required
                "nvim-telescope/telescope.nvim",    -- Search and Quick-Switch functionality
                "nvim-treesitter/nvim-treesitter",
            },
            opts = {
                mappings = {}, -- Empty table removes default key maps
                workspaces = {
                    { name = "masters", path = "/mnt/c/Users/piotr/obsidian-vaults" }
                },
                completion = {
                    nvim_cmp = true, -- Use nvim_cmp for completions
                    min_chars = 2, -- Trigger completion character threshold
                },
                picker = {
                    -- Picker alternatives: telescope.nvim, fzf-lua, mini.pick
                    name = "telescope.nvim",
                    note_mappings = {
                        new = "<C-x>", -- Create new note from query
                        insert_link = "<C-l>", -- Insert link to selected note
                    },
                    tag_mappings = {
                        tag_note = "<C-x>", -- Add tag(s) to current note
                        insert_tag = "<C-l>", -- Insert tag at current location
                    }
                }
            }, -- <<< opts
            config = function()
                vim.api.nvim_create_autocmd("FileType", {
                    pattern = { "markdown", "obsidian" },
                    callback = function() vim.opt_local.concellevel = 2 end,
                })
            end
        }
    }
