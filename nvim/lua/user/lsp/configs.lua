local blink_cmp = require("blink.cmp")
local navic = require("nvim-navic")

local servers = {
  "lua_ls",
  "ts_ls",
  "rust_analyzer",
  "tailwindcss",
  "cssls",
  "cssmodules_ls",
  "clangd",
  "gopls",
  "verible"
}

--[[ mlc.setup({ ]]
--[[   ensure_installed = servers, ]]
--[[   automatic_installation = true, ]]
--[[ }) ]]

--[[ for _, server in pairs(servers) do ]]
--[[   local opts = { ]]
--[[     on_attach = require("user.lsp.handlers").on_attach, ]]
--[[     capabilities = require("user.lsp.handlers").capabilities, ]]
--[[     root_dir = function(fname) ]]
--[[       return vim.fn.getcwd() ]]
--[[     end ]]
--[[   } ]]
--[[   local has_custom_opts, server_custom_opts = pcall(require, "user.lsp.settings." .. server) ]]
--[[   if has_custom_opts then ]]
--[[     opts = vim.tbl_deep_extend("force", opts, server_custom_opts) ]]
--[[   end ]]
--[[   lspconfig[server].setup(opts) ]]
--[[ end ]]

local opts = {
  capabilities = blink_cmp.get_lsp_capabilities({
    textDocument = {
      completion = { completionItem = { snippetSupport = true } },
      foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true
      },

    }
  }),
  on_attach = function(client, bufnr)
    if client.server_capabilities.documentSymbolProvider then
      navic.attach(client, bufnr)
    end
  end
}

for _, server in pairs(servers) do
  local has_custom_opts, server_custom_opts = pcall(require, "user.lsp.settings." .. server)
  if has_custom_opts then
    vim.lsp.config(server, vim.tbl_deep_extend("force", opts, server_custom_opts))
  end

  vim.lsp.enable(server)
end
