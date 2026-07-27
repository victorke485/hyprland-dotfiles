return {
    {
        "okuuva/auto-save.nvim",
        cmd = "ASToggle",
        event = { "InsertLeave", "TextChanged" },
        opts = {
            enabled = true,
            debounce_delay = 1000,
            noautocmd = false,

            condition = function(buf)
                local fn = vim.fn
                local utils = require("auto-save.utils.data")
                if fn.getbufvar(buf, "&modifiable") == 1 and
                    utils.not_in(fn.getbufvar(buf, "&filetype"), {}) and
                    fn.getbufvar(buf, "&buftype") == "" then
                    return true
                end
                return false
            end,
        },
        keys = {
            { "<leader>as", "<cmd>ASToggle<cr>", desc = "Toggle Autosave" },
        }
    }
}
