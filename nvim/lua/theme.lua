local M = {
  colorscheme = "tokyonight",
  lualine = "tokyonight",
}
vim.g.tokyonight_style = "night"
vim.cmd("colorscheme" .. " " .. M.colorscheme)

return M
