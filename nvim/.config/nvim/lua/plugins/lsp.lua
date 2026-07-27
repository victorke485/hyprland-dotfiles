return {
    {
        "mason-org/mason.nvim",
        opts = {},
    },
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {
            ensure_installed = {
                -- Python
                "pyright",
                "ruff",

                -- Web
                "ts_ls",
                "html",
                "cssls",
                "tailwindcss",
                "emmet_ls",
                "eslint",
                "jsonls",

                -- C/C++
                "clangd",
            },
            automatic_enable = false,
        },
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
    },

    {
        "neovim/nvim-lspconfig",
        config = function()
            vim.lsp.enable({
                -- Python
                "pyright",
                "ruff",

                -- Web
                "ts_ls",
                "html",
                "cssls",
                "tailwindcss",
                "emmet_ls",
                "eslint",
                "jsonls",

                -- C/C++
                "clangd",
            })

            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup('lsp_attach_disable_ruff_hover', { clear = true }),
                callback = function(args)
                    local client = vim.lsp.get_client_by_id(args.data.client_id)
                    if client == nil then
                        return
                    end
                    if client.name == 'ruff' then
                        -- Disable hover in favor of Pyright
                        client.server_capabilities.hoverProvider = false
                    end
                end,
                desc = 'LSP: Disable hover capability from Ruff',
            })
        end,
    },
}
