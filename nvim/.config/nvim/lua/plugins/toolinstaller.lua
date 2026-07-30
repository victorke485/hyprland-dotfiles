return {
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "mason-org/mason.nvim" },
		opts = {
			ensure_installed = {
				-- LSP
				"pyright",
				"ruff",

				"ts_ls",
				"html",
				"cssls",
				"tailwindcss",
				"emmet_ls",
				"eslint",
				"jsonls",

				"clangd",

				"lua_ls",

				-- Formatters
				-- "ruff",
				"prettier",
				"clang-format",
				"stylua",

				-- Linters
				-- "ruff",

				"eslint_d",
				"htmlhint",
				"stylelint",
				"luacheck",

				"cpplint",
			},
		},
	},
}
