-- ~/.config/nvim/lua/config/luasnip.lua

local M = {}

function M.setup()
    local luasnip = require("luasnip")

    -- Optional: Load snippets from common collections like friendly-snippets
    -- Ensure you have 'rafamadriz/friendly-snippets' in your plugins.lua if you use this
    -- To lazy load:
    -- require("luasnip.loaders.from_vscode").lazy_load()
    -- To load specific paths or filetypes:
    -- require("luasnip.loaders.from_vscode").load({ paths = { "./snippets" }}) -- for local project snippets
    -- require("luasnip.loaders.from_snipmate").load({ paths = { "./snippets_snipmate" }})

    -- Keymaps for navigating snippet placeholders (nvim-cmp often handles this too)
    -- These are useful if you trigger snippets outside of cmp or want explicit control.
    vim.keymap.set({ "i", "s" }, "<C-l>", function() -- C-l for next placeholder
        if luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
        end
    end, { silent = true })

    vim.keymap.set({ "i", "s" }, "<C-h>", function() -- C-h for previous placeholder
        if luasnip.jumpable(-1) then
            luasnip.jump(-1)
        end
    end, { silent = true })

    -- Example: Add custom snippets (uncomment and modify as needed)
    -- luasnip.add_snippets("lua", {
    --   luasnip.s("fn", { -- 's' for snippet, 'fn' is the trigger
    --     t("function "), -- 't' for text node
    --     luasnip.i(1, "name"), -- 'i' for insert node, 1 is the tab stop order
    --     t("("),
    --     luasnip.i(2, "params"),
    --     t(")"),
    --     luasnip.c(3, { t(""), t({ "", "\t-- body" }) }), -- 'c' for choice node
    --     luasnip.i(0), -- 0 is the final tab stop
    --     t({ "", "end" }),
    --   }),
    -- })

    -- luasnip.add_snippets("python", {
    --   luasnip.s("def", {
    --     t("def "),
    --     luasnip.i(1, "function_name"),
    --     t("("),
    --     luasnip.i(2, "arguments"),
    --     t("):"),
    --     luasnip.c(3, {t(""), t({"", "\tpass"})}),
    --     luasnip.i(0)
    --   })
    -- })
end

return M
