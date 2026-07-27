return {
    {
        'saghen/blink.cmp',
        dependencies = {
            'saghen/blink.lib',
            'L3MON4D3/LuaSnip',
            'rafamadriz/friendly-snippets'
        },
        build = function()
            require("blink.cmp").build():pwait()
        end,
        opts = {
            keymap = { preset = 'default' },
            completion = { documentation = { auto_show = false } },
            sources = { default = { 'lsp', 'path', 'snippets', 'buffer' } },
            fuzzy = { implementation = "rust" }
        },
        config = function(_, opts)
            require("blink.cmp").setup(opts)
            require("luasnip.loaders.from_vscode").lazy_load()
        end
    }
}
-- Default keymaps:
-- 'super-tab' for mappings similar to vscode (tab to accept)
-- 'enter' for enter to accept
-- 'none' for no mappings
-- C-y to accept
-- C-space: Open menu or open docs if already open
-- C-n/C-p or Up/Down: Select next/previous item
-- C-e: Hide menu
-- C-k: Toggle signature help (if signature.enabled = true)
