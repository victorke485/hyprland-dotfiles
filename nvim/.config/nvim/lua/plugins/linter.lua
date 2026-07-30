return {
  "mfussenegger/nvim-lint",
  dependencies = { "WhoIsSethDaniel/mason-tool-installer.nvim" },
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      python = { "ruff" },

      html = { "htmlhint" },
      css = { "stylelint" },
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },

      lua = { "luacheck" },

      c = { "cpplint", "clangtidy" },
      cpp = { "cpplint", "clangtidy" },
    }

    vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost", "InsertLeave" }, {
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
