local M = {}

local formatting_disabled = {
  "sumneko_lua",
  "ts_ls",
  "eslint",
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
