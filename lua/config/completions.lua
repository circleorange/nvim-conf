-- ~/.config/nvim/lua/config/cmp.lua

local M = {}

function M.setup()
    local cmp = require("cmp")
    local luasnip = require("luasnip") -- Required for snippet expansion

    local has_words_before = function()
        if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

    local feedkey = function(key, mode)
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
    end


    cmp.setup({
        snippet = {
            -- REQUIRED - you must specify a snippet engine
            expand = function(args)
                luasnip.lsp_expand(args.body) -- For "L3MON4D3/LuaSnip"
            end,
        },
        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
            ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
            ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
            ["<C-b>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<C-e>"] = cmp.mapping.abort(),
            ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            ["<Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                elseif has_words_before() then
                    cmp.complete()
                else
                    fallback() -- Fallback to default Tab behavior
                end
            end, { "i", "s" }), -- "i" for insert mode, "s" for select mode (visual)
            ["<S-Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback() -- Fallback to default Shift-Tab behavior
                end
            end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
            { name = "nvim_lsp" },
            { name = "luasnip" }, -- For LuaSnip integration
        }, {
            { name = "buffer" },
            { name = "path" },
        }),
        formatting = {
            fields = { "kind", "abbr", "menu" },
            format = function(entry, vim_item)
                -- Kind Icons (requires nvim-web-devicons)
                if vim.fn.has("nvim-0.9.0") == 1 and require("lazy.core.config").plugins["nvim-web-devicons"] then -- Check if devicons is loaded
                    local devicons = require("nvim-web-devicons")
                    if devicons then
                        local icon, hl = devicons.get_icon(vim_item.kind, nil, { default = false })
                        vim_item.kind = (icon or "") .. " " .. vim_item.kind
                        if hl then vim_item.kind_hl_group = hl end
                    end
                end

                -- Source Menu
                vim_item.menu = ({
                    nvim_lsp = "[LSP]",
                    luasnip = "[Snip]",
                    buffer = "[Buffer]",
                    path = "[Path]",
                })[entry.source.name]
                return vim_item
            end,
        },
        experimental = {
            ghost_text = true, -- Shows completion suggestion inline (requires nvim nightly or 0.10+)
        },
    })

    -- Set up completion for command mode
    cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
            { name = "path" },
        }, {
            { name = "cmdline" },
        }),
    })

    -- Set up completion for search mode
    cmp.setup.cmdline("/", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
            { name = "buffer" }, -- or other relevant sources for search
        },
    })
end

return M
