return
    {
        {
            -- Markdown LSP and browser live preview
            -- Commands:
            --      :RenderMarkdown toggle - Toggle state (Enable/ Disable) of the plugin.
            "MeanderingProgrammer/render-markdown.nvim",
            dependencies = {
                "nvim-treesitter/nvim-treesitter",
                "echasnovski/mini.nvim",
            },
            opts = {
                enabled = true, -- Markdown rendering by default
                -- In-Process LSP
                completions = { lsp = { enabled = true }},
                latex = {
                    enabled = false,
                },
            },
            config = function(_, opts)
                require "render-markdown".setup(opts)

                local cmp = require "cmp"
                cmp.setup {
                    sources = cmp.config.sources {
                        { name = "render-markdown" },
                    }
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
            -- Only load obsidian.nvim for markdown files in Obsidian vault directory.
            event = {
                "BufReadPre " .. "/mnt/c/Users/piotr/obsidian-vaults/masters/*.md",
                "BufNewFile " .. "/mnt/c/Users/piotr/obsidian-vaults/masters/*.md",
            },
            dependencies = {
                "nvim-lua/plenary.nvim",            -- Required
                "nvim-telescope/telescope.nvim",    -- Search and Quick-Switch functionality
                "nvim-treesitter/nvim-treesitter",
            },
            opts = {
                mappings = {}, -- Empty table removes default key maps
                workspaces = {
                    { name = "masters", path = "/mnt/c/Users/piotr/obsidian-vaults/masters" }
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
                },
                buffer = true,
                ui = {
                    enable = false, -- Syntax highlighting (Already covered by render-markdown)
                },
            }, -- <<< opts
            config = function(_, opts)
                vim.api.nvim_create_autocmd("FileType", {
                    pattern = { "markdown", "obsidian" },
                    callback = function() vim.opt.concellevel = 2 end,
                })
                require "nvim-treesitter".setup {
                    ensure_installed = { "markdown", "markdown_inline" },
                    highlight = { enable = true },
                }
                require "obsidian".setup(opts)
            end -- << config
        }
    }
