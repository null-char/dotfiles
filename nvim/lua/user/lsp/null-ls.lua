local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

local formatting = null_ls.builtins.formatting

null_ls.setup({
  debug = false,
  root_dir = require("null-ls.utils").root_pattern(".git", "package.json"),
  sources = {
    formatting.prettierd.with({
      command = "prettierd",
    }),
    --[[ formatting.verible_verilog_format.with({ ]]
    --[[   command = bin_dir .. "/verible-verilog-format" ]]
    --[[ }), ]]
    --[[ require("none-ls.diagnostics.eslint_d").with({ ]]
    --[[   command = bin_dir .. "/eslint_d", ]]
    --[[ }), ]]
    --[[ require("none-ls.code_actions.eslint_d").with({ ]]
    --[[   command = bin_dir .. "/eslint_d", ]]
    --[[ }) ]]
  }
})
