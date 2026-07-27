return {
    {
        'stevearc/conform.nvim',
        opts = {
            formatters_by_ft = {
                python = { "ruff_format" },
                javascript = { "prettier" },
                typescript = { "prettier" },
                javascriptreact = { "prettier" },
                typescriptreact = { "prettier" },
                html = { "prettier" },
                css = { "prettier" },
                json = { "prettier" },
                c = { "clang_format" },
                cpp = { "clang_format" },
            },
            format_on_save = {
                timeout_ms = 500,
                lsp_format = "fallback"
            }
        },
    }
}
