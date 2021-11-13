if vim.g.vscode then
  return
end

local u = require("utils")

vim.g.mapleader = ","
vim.g.maplocalleader = ";"

vim.cmd("set shell=/bin/bash")
vim.opt.showcmd = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.mouse = "a"
vim.opt.pumheight = 10
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.updatetime = 300
vim.opt.scrolloff = 4
vim.opt.sidescrolloff = 2
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.timeoutlen = 500
vim.opt.linebreak = true
-- how tabs should work
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = -1
vim.opt.shiftwidth = 0
vim.opt.shiftround = true
vim.opt.shortmess:append("cA")
vim.opt.clipboard:append("unnamedplus")

vim.cmd("autocmd BufEnter * setlocal formatoptions-=cro")

-- initialize global object for config
global = {}

u.imap("jk", "<Esc>", { noremap = true })
u.nmap("<C-s>", ":w<CR>", { noremap = true })

-- maps
-- make going to normal mode from terminals less painful
u.tmap("<C-o>", "<C-\\><C-n>")

-- make useless keys useful
u.nmap("<BS>", "<C-^>")

u.nmap("<Esc>", ":nohl<CR>")

-- copilot
-- u.imap("<C-f>", "copilot#Accept('<CR>')", { silent = true, script = true, expr = true })
-- vim.g.copilot_no_tab_map = true

u.nmap("<Tab>", "%", { noremap = false })
u.xmap("<Tab>", "%", { noremap = false })
u.omap("<Tab>", "%", { noremap = false })

u.imap("<S-Tab>", "<Esc>A")
u.nmap("<S-CR>", ":wqall<CR>")

u.nmap("H", "^")
u.omap("H", "^")
u.xmap("H", "^")
u.nmap("L", "$")
u.omap("L", "$")
u.xmap("L", "$")

u.nmap("<Space>", ":", { silent = false })
u.xmap("<Space>", ":", { silent = false })

-- save on <CR> in normal buffers
u.map("n", "<CR>", "(&buftype is# '' ? ':w<CR>' : '<CR>')", { expr = true })

-- buffer management
u.nmap("<Leader>c", ":Bdelete<CR>")
u.nmap("<Leader>bn", ":TablineBufferNext<CR>")
u.nmap("<Leader>bp", ":TablineBufferPrevious<CR>")

-- tabs
u.nmap("<LocalLeader>tt", ":tabnew<CR>")
u.nmap("<LocalLeader>te", ":tabedit %<CR>")
u.nmap("<LocalLeader>tx", ":tabclose<CR>")
u.nmap("<LocalLeader>to", ":tabonly<CR>")

-- explorer
u.nmap("<Leader>ee", ":NvimTreeToggle<CR>")
u.nmap("<Leader>ef", ":NvimTreeFindFileToggle<CR>")

-- diagnostics
u.nmap("<Leader>td", ":TroubleToggle<CR>")

-- misc
u.xmap(">", ">gv")
u.xmap("<", "<gv")

u.nmap("n", "nzz")
u.nmap("N", "Nzz")

-- automatically add jumps > 1 to jump list
u.nmap("k", [[(v:count > 1 ? "m'" . v:count : '') . 'k'"]], { expr = true })
u.nmap("j", [[(v:count > 1 ? "m'" . v:count : '') . 'j'"]], { expr = true })

-- autocommands
-- highlight on yank
vim.cmd('autocmd TextYankPost * silent! lua vim.highlight.on_yank({ higroup = "IncSearch", timeout = 500 })')

-- terminals
-- always start in insert mode
vim.cmd("autocmd TermOpen * startinsert")
-- disable line numbers
vim.cmd("autocmd TermOpen * setlocal nonumber norelativenumber")
-- close without showing exit code
vim.cmd("autocmd TermClose * execute 'bdelete! ' . expand('<abuf>')")

-- source remaining config
require("tmux")
require("commands")
require("plugins")
require("lsp")
pcall(require, "theme")

