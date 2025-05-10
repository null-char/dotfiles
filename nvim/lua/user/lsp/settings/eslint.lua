return {
  cmd = { "eslint" },
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
    --[[ require("user.lsp.handlers").on_attach(client, bufnr) ]]
  end,
}
