vim.cmd("packadd packer.nvim")
return require("packer").startup({
    function(use)
         use({ "wbthomason/packer.nvim", opt = true })

         local config = function(name)
             return string.format("require('plugins.%s')", name)
         end

         local use_with_config = function(path, name)
             use({ path, config = config(name) })
         end

        -- basic
         use("tpope/vim-sleuth") -- detect indentation
         use_with_config("numToStr/Comment.nvim", "comment") -- comment plugin
         use({
             { "lewis6991/gitsigns.nvim", config = config("git"), requires = "nvim-lua/plenary.nvim" }, -- git plugins
             { "kdheepak/lazygit.nvim", config = config("lazygit") },
         })

        -- dashboard
        use_with_config("glepnir/dashboard-nvim", "dashboard")

        -- filetree
         use({
             "kyazdani42/nvim-tree.lua",
             requires = "kyazdani42/nvim-web-devicons",
             config = function()
                 require("nvim-tree").setup({})
             end,
         })

         use_with_config("andymass/vim-matchup", "matchup") -- improves %, now with treesitter

        -- additional functionality
         use("ggandor/lightspeed.nvim") -- motion
         use_with_config("L3MON4D3/LuaSnip", "luasnip") -- snippets
         use("saadparwaiz1/cmp_luasnip")
         use("rafamadriz/friendly-snippets")
         use({
             "hrsh7th/nvim-cmp", -- completion
             requires = {
                 "hrsh7th/cmp-nvim-lsp",
                 "hrsh7th/cmp-nvim-lua",
                 "hrsh7th/cmp-buffer",
                 "L3MON4D3/LuaSnip",
                 "hrsh7th/cmp-path",
             },
             config = config("cmp"),
         })
         use({
             "windwp/nvim-autopairs", -- autocomplete pairs
             config = config("autopairs"),
             wants = "nvim-cmp",
         })

        -- integrations
         use({
             "nvim-telescope/telescope.nvim", -- fuzzy finder
             config = config("telescope"),
             requires = {
                 {
                     "nvim-telescope/telescope-fzf-native.nvim", -- better algorithm
                     run = "make",
                 },
             },
         })

        -- lsp
         use("neovim/nvim-lspconfig") -- makes lsp configuration easier
         use_with_config("RRethy/vim-illuminate", "illuminate") -- highlights and allows moving between variable references
         use("jose-elias-alvarez/null-ls.nvim") -- allows using neovim as language server
         use("onsails/lspkind-nvim") -- better formatting for nvim-cmp
         -- JSON schemastore for language server
         use("b0o/schemastore.nvim")

        -- development
         use("jose-elias-alvarez/nvim-lsp-ts-utils") -- improve typescript experience

         -- treesitter
         use({
             "nvim-treesitter/nvim-treesitter",
             run = ":TSUpdate",
             config = config("treesitter"),
         })
         use({ "windwp/nvim-ts-autotag", ft = { "typescript", "typescriptreact" } }) -- automatically close jsx tags
         use({ "JoosepAlviste/nvim-ts-context-commentstring", ft = { "typescript", "typescriptreact" } }) -- makes jsx comments actually work

        -- visual
         use({ -- themes
             "sainnhe/sonokai",
             "rmehri01/onenord.nvim",
             "EdenEast/nightfox.nvim",
             "folke/tokyonight.nvim",
         })
         use_with_config("nvim-lualine/lualine.nvim", "lualine") -- statusline and tabline
         use({
             "kdheepak/tabline.nvim",
             config = config("tabline"),
             requires = {
                 { "nvim-lualine/lualine.nvim", opt = true },
                 { "kyazdani42/nvim-web-devicons", opt = true },
             },
         })
         -- Better close buffer commands
         use('kazhala/close-buffers.nvim')

        -- misc
         use("nvim-lua/plenary.nvim") -- required for plugins, testing, and more
         use_with_config("nathom/filetype.nvim", "filetype") -- greatly reduce startup time
         use("lewis6991/impatient.nvim")
    end,
})
