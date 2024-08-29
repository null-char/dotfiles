-- Automatically install lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  "nvim-lua/plenary.nvim", -- Useful lua functions used by lots of plugins
  "windwp/nvim-autopairs", -- Autopairs, integrates with cmp & treesitter
  "numToStr/Comment.nvim",
  "JoosepAlviste/nvim-ts-context-commentstring",
  "nvim-tree/nvim-web-devicons",
  "echasnovski/mini.files",
  "moll/vim-bbye",
  "nvim-lualine/lualine.nvim",
  "feline-nvim/feline.nvim",
  "akinsho/toggleterm.nvim",
  "ahmedkhalf/project.nvim",
  "github/copilot.vim",
  "Robitx/gp.nvim",
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
    config = function()
      require("ibl").setup()
    end
  },
  "goolord/alpha-nvim",
  {
    "folke/which-key.nvim",
    version = "v2.*"
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end,       desc = "Flash" },
      { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o",               function() require("flash").remote() end,     desc = "Remote Flash" },
      {
        "R",
        mode = { "o", "x" },
        function() require("flash").treesitter_search() end,
        desc =
        "Treesitter Search"
      },
      {
        "<c-s>",
        mode = { "c" },
        function() require("flash").toggle() end,
        desc =
        "Toggle Flash Search"
      },
    },
  },

  -- colorschemes
  { "rebelot/kanagawa.nvim",  name = "kanagawa" },
  { "catppuccin/nvim",        name = "catppuccin" },
  { "EdenEast/nightfox.nvim", name = "nightfox" },
  { "sainnhe/sonokai",        name = "sonokai" },
  { "folke/tokyonight.nvim",  name = "tokyonight" },

  -- cmp plugins
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "saadparwaiz1/cmp_luasnip",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-nvim-lua",

  -- snippets
  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp"
  },
  "rafamadriz/friendly-snippets",

  -- LSP
  "neovim/nvim-lspconfig",
  "williamboman/mason.nvim", -- Manage external dependencies (language servers, debuggers, etc)
  "williamboman/mason-lspconfig.nvim",
  {
    "utilyre/barbecue.nvim", -- LSP context on winbar
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    config = function()
      require("barbecue").setup()
    end,
  },
  -- formatters/linters (plugin is maintenance only, find alternative)
  "jose-elias-alvarez/null-ls.nvim",
  "mfussenegger/nvim-jdtls",
  "folke/neodev.nvim",
  { "antosha417/nvim-lsp-file-operations", dependencies = { { "nvim-lua/plenary.nvim" } } },
  "nvimdev/lspsaga.nvim",

  -- fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    branch = '0.1.x',
    dependencies = {
      { 'nvim-lua/plenary.nvim' } }
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build =
    'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
  },
  {
    "danielfalk/smart-open.nvim", -- best possible suggestions for the file picker
    branch = "0.2.x",
    config = function()
      require("telescope").load_extension("smart_open")
    end,
    dependencies = {
      "kkharji/sqlite.lua",
      -- Only required if using match_algorithm fzf
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      -- Optional.  If installed, native fzy will be used when match_algorithm is fzy
      { "nvim-telescope/telescope-fzy-native.nvim" },
    },
  },

  -- treesitter
  "nvim-treesitter/nvim-treesitter",

  -- git
  {
    "lewis6991/gitsigns.nvim",
    version = "v0.7"
  },
  {
    'ruifm/gitlinker.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  {
    'pwntester/octo.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'nvim-tree/nvim-web-devicons',
    },
  },
  "sindrets/diffview.nvim",

  -- misc
  "windwp/nvim-ts-autotag", -- auto close tags
  "luukvbaal/statuscol.nvim",
  {
    "kevinhwang91/nvim-ufo", -- better folds
    dependencies = { 'kevinhwang91/promise-async' },
  },
  {
    "nacro90/numb.nvim", -- peek line numbers
    config = function()
      require('numb').setup()
    end
  },
  {
    "brenoprata10/nvim-highlight-colors",
    config = function()
      require('nvim-highlight-colors').setup()
    end
  },
  {
    'tamton-aquib/duck.nvim',
    config = function()
      vim.keymap.set('n', '<leader>dd', function() require("duck").hatch() end, {})
      vim.keymap.set('n', '<leader>dk', function() require("duck").cook() end, {})
    end
  }
})
