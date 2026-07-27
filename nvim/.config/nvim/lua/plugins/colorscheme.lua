return {
    {
        -- Catppuccin for Neovim
        -- https://github.com/catppuccin/nvim
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000, -- load before other plugins
        config = function()
            -- catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
            vim.cmd.colorscheme("catppuccin-mocha")
        end,
    }
}
