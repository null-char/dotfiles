--[[ require("catppuccin").setup({ ]]
--[[   flavour = "mocha", -- latte, frappe, macchiato, mocha ]]
--[[   background = {     -- :h background ]]
--[[     light = "latte", ]]
--[[     dark = "mocha", ]]
--[[   } ]]
--[[ }) ]]

-- Custom catppuccin theme. See: https://github.com/ayamir/nvimdots/blob/61fe5b7f5374beaee18c0c730441d55ad5911604/lua/modules/ui/config.lua#L125
require("catppuccin").setup({
  flavour = "macchiato", -- Can be one of: latte, frappe, macchiato, mocha
  background = { light = "latte", dark = "macchiato" },
  dim_inactive = {
    enabled = false,
    -- Dim inactive splits/windows/buffers.
    -- NOT recommended if you use old palette (a.k.a., mocha).
    shade = "dark",
    percentage = 0.15,
  },
  integrations = {
    treesitter = true,
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = { "italic" },
        hints = { "italic" },
        warnings = { "italic" },
        information = { "italic" },
      },
      underlines = {
        errors = { "underline" },
        hints = { "underline" },
        warnings = { "underline" },
        information = { "underline" },
      },
    },
    lsp_trouble = true,
    lsp_saga = true,
    gitgutter = false,
    gitsigns = true,
    telescope = true,
    nvimtree = true,
    which_key = true,
    indent_blankline = { enabled = true, colored_indent_levels = false },
    dashboard = true,
    neogit = false,
    vim_sneak = false,
    fern = false,
    barbar = false,
    markdown = true,
    lightspeed = true,
    ts_rainbow = true,
    mason = true,
    neotest = false,
    noice = false,
    hop = true,
    illuminate = true,
    cmp = true,
    dap = { enabled = true, enable_ui = true },
    notify = true,
    symbols_outline = false,
    coc_nvim = false,
    leap = false,
    neotree = { enabled = false, show_root = true, transparent_panel = false },
    telekasten = false,
    mini = true,
    aerial = false,
    vimwiki = true,
    beacon = false,
    navic = {
      enabled = true,
      custom_bg = "NONE",
    },
    overseer = false,
    fidget = true,
  },
})

vim.cmd("colorscheme catppuccin")
