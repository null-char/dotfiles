-- Default options:
require('kanagawa').setup({
  theme = "dragon", -- "wave" | "dragon" | "lotus"
  colors = {
    -- make gutter transparent
    theme = { all = { ui = { bg_gutter = "NONE" } } }
  }
})

-- setup must be called before loading
vim.cmd("colorscheme kanagawa-dragon")
