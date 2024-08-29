require('nvim-ts-autotag').setup({
  opts = {
    enable_close = true,         -- Auto close tags,
    enable_rename = true,        -- Auto rename tags,
    enable_close_on_slash = true -- Auto close on trailing </
  },
})
