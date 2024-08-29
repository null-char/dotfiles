local lspconfig = require("lspconfig")
local mlc = require("mason-lspconfig")

local servers = {
  "lua_ls",
  "tsserver",
  "eslint",
  "rust_analyzer",
  "tailwindcss",
  "cssls",
  "cssmodules_ls",
  "clangd",
  "gopls"
}

mlc.setup({
  ensure_installed = servers,
  automatic_installation = true,
})

for _, server in pairs(servers) do
  local opts = {
    on_attach = require("user.lsp.handlers").on_attach,
    capabilities = require("user.lsp.handlers").capabilities,
    root_dir = function(fname)
      return vim.fn.getcwd()
    end
  }
  local has_custom_opts, server_custom_opts = pcall(require, "user.lsp.settings." .. server)
  if has_custom_opts then
    opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
  end
  lspconfig[server].setup(opts)
end
