local M = {}

local formatting_disabled = {
  "sumneko_lua",
  "ts_ls",
  "typescript-tools",
  "eslint", -- we only let prettier do formatting even when formatting options are specified in eslint (prettier can infer eslint config)
}

M.lsp_format = function()
  vim.lsp.buf.format({
    filter = function(client)
      for _, value in pairs(formatting_disabled) do
        if client.name == value then
          return false
        end
      end
      return true
    end
  })
end

return M
