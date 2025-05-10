local theme = "gruvbox"

local status_ok, _ = pcall(require, "user.themes." .. theme)
if not status_ok then
  vim.cmd([[
  colorscheme default
  set background=dark
  ]])
end

vim.cmd([[hi Visual guifg=none ctermfg=none]])
