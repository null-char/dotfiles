vim.api.nvim_create_autocmd('User', {
  pattern = "MiniFilesActionRename",
  callback = function(args)
    local old_name = args.data.from
    local new_name = args.data.to
    require('lsp-file-operations.will-rename').callback({ old_name, new_name })
  end
})
