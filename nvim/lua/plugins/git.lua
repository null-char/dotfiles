local u = require("utils")

require("gitsigns").setup({
    current_line_blame = false,
    preview_config = {
        -- Options passed to nvim_open_win
        border = "single",
        style = "minimal",
        relative = "cursor",
        row = 0,
        col = 1,
        focusable = true,
    },
})

u.nmap("<Leader>g", ":tab Git<CR>")
u.nmap("<Leader>G", ":Git ", { silent = false })

vim.cmd("autocmd FileType fugitive nmap <buffer> <Tab> =")
