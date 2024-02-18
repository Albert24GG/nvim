local M = {}

local merge_tb = vim.tbl_deep_extend

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local lspconfig = require "lspconfig"

local servers = {
  "html",
  "cssls",
  "tsserver",
  "clangd",
  "gopls",
  "jsonls",
  "bashls",
  "rust_analyzer",
  "pyright",
  "marksman",
}

for _, lsp in ipairs(servers) do
  local opts = {
    capabilities = capabilities,
  }

  local exists, settings = pcall(require, "custom.configs.lsp.server-settings." .. lsp)
  if exists then
    opts = merge_tb("force", settings, opts)
  end

  lspconfig[lsp].setup(opts)
end

local config = {
  virtual_text = true,
  signs = true,
}

vim.diagnostic.config(config)

return M
