local blink_cmp = require("blink.cmp")
local navic = require("nvim-navic")

local servers = {
  "lua_ls",
  -- using typescript-tools for now. would be good to eventually move to tsgo whenever that hits 1.0
  -- "ts_ls",
  "typescript_tools",
  "eslint",
  "tailwindcss",
  "cssls",
  "cssmodules_ls",
  "ty",
  "ruff"
}

local opts = {
  capabilities = blink_cmp.get_lsp_capabilities({
    textDocument = {
      completion = { completionItem = { snippetSupport = true } },
      foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true
      }
    }
  }),
  on_attach = function(client, bufnr)
    if client.server_capabilities.documentSymbolProvider then
      navic.attach(client, bufnr)
    end
  end
}

for _, server in pairs(servers) do
  if server == "typescript_tools" then
    require("typescript-tools").setup {
      on_attach = function(client, bufnr)
        opts.on_attach(client, bufnr)
      end,
      capabilities = opts.capabilities,
    }

    goto continue
  end

  local has_custom_opts, server_custom_opts = pcall(require, "user.lsp.settings." .. server)
  if has_custom_opts then
    -- if custom_opts has on_attach, we need to first call the base on_attach, then the custom one
    if server_custom_opts.on_attach then
      local base_on_attach = opts.on_attach
      local custom_on_attach = server_custom_opts.on_attach

      server_custom_opts.on_attach = function(client, bufnr)
        base_on_attach(client, bufnr)
        custom_on_attach(client, bufnr)
      end
    end

    vim.lsp.config(server, vim.tbl_deep_extend("force", opts, server_custom_opts))
  end

  vim.lsp.enable(server)

  ::continue::
end
