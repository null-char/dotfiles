local u = require("utils")

vim.g.matchup_matchparen_offscreen = { method = "popup", border = "shadow" }
vim.g.matchup_surround_enabled = true
vim.g.matchup_matchparen_deferred = true
vim.g.matchup_matchparen_enabled = 0

u.xmap("i<Tab>", "<Plug>(matchup-i%)", { noremap = false })
u.omap("i<Tab>", "<Plug>(matchup-i%)", { noremap = false })
u.xmap("a<Tab>", "<Plug>(matchup-a%)", { noremap = false })
u.omap("a<Tab>", "<Plug>(matchup-a%)", { noremap = false })
