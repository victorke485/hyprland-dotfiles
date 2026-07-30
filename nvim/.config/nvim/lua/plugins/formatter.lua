return {
	{
		"stevearc/conform.nvim",
		dependencies = { "WhoIsSethDaniel/mason-tool-installer.nvim" },
		opts = {
			formatters_by_ft = {
				python = { "ruff_format" },
				javascript = { "prettier", "eslint_d" },
				typescript = { "prettier", "eslint_d" },
				javascriptreact = { "prettier", "eslint_d" },
				typescriptreact = { "prettier", "eslint_d" },
				html = { "prettier" },
				css = { "prettier" },
				json = { "prettier" },
				c = { "clang_format" },
				cpp = { "clang_format" },
				lua = { "stylua" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
		},
	},
}
