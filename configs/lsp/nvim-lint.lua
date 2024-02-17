local lint = require("lint")

lint.linters_by_ft = {
  c = { "clangtidy" },
  cpp = { "clangtidy" },
  python = { "ruff" },
  lua = { "luacheck" },
  bash = { "shellcheck" },
  markdown = { "markdownlint" },
  json = { "jsonlint" },
  yaml = { "yamllint" },
  rust = { "clippy" },
  go = { "golangcilint" },
}

vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
