local conform = require("conform")

conform.setup({
  formatters_by_ft = {
    lua = {"stylua"},
    python = {"black"},
    c = {"clang-format"},
    cpp = {"clang-format"},
    rust = {"rustfmt"},
    json = {"prettier"},
    markdown = {"prettier"},
  }
})
