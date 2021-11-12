local theme_ok, theme = pcall(require, "theme")
theme = theme_ok and theme.lualine or "auto" -- fall back to auto if unavailable or unspecified

local gitsigns_diff = function()
    local gitsigns = vim.b.gitsigns_status_dict
    if gitsigns then
        return {
            added = gitsigns.added,
            modified = gitsigns.changed,
            removed = gitsigns.removed,
        }
    end
end

-- hide tabline if only 1 tab is open
-- vim.cmd("autocmd OptionSet showtabline :set showtabline=1")

require("lualine").setup({
    options = {
        component_separators = "",
        section_separators = { left = "", right = "" },
        icons_enabled = false, -- disable icons unless specifically enabled
        theme = theme,
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = {
            -- use gitsigns for diff info
            { "b:gitsigns_head", icon = "", icons_enabled = true },
            { "diff", source = gitsigns_diff },
        },
        lualine_c = {
            { "filename", file_status = false },
            {
                "diagnostics",
                sources = { "nvim_lsp" },
                icons_enabled = true,
            },
        },
        lualine_x = { "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
    },
    extensions = { "fugitive" },
})
