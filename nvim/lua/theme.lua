local theme = "tokyonight"

local M = {
  colorscheme = theme,
  lualine = theme,
}

-- Theme configuration
require("plugins.themes." .. theme)

return M
