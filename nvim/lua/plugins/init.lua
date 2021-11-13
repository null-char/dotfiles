vim.cmd("packadd packer.nvim")
return require("packer").startup(function()
    use({ "wbthomason/packer.nvim", opt = true })

    local config = function(name)
        return string.format("require('plugins.%s')", name)
    end

    local use_with_config = function(path, name)
        use({ path, config = config(name) })
    end

    -- basic
    use("tpope/vim-repeat")
    use("tpope/vim-surround")
    use("tpope/vim-unimpaired")
    use("tpope/vim-sleuth") -- detect indentation
    use_with_config("numToStr/Comment.nvim", "comment") -- comment plugin
    use({
        { "lewis6991/gitsigns.nvim", config = config("git") }, -- git plugins
        { "tpope/vim-fugitive", requires = "tpope/vim-rhubarb" },
        { "kdheepak/lazygit.nvim", config = config("lazygit") }
    })
    use({
        "liuchengxu/vim-which-key",
    })

    -- dashboard
    use_with_config("glepnir/dashboard-nvim", "dashboard")

    -- filetree
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function() require'nvim-tree'.setup {} end
    }

    -- copilot
    -- use("github/copilot.vim")

    -- diagnostics
    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
    }

    -- text objects
    use("wellle/targets.vim") -- many useful additional text objects
    use({
        "kana/vim-textobj-user",
        {
            "kana/vim-textobj-entire", -- ae/ie for entire buffer
            "Julian/vim-textobj-variable-segment", -- av/iv for variable segment
            "michaeljsmith/vim-indent-object", -- ai/ii for indentation area
            "beloglazov/vim-textobj-punctuation", -- au/iu for punctuation
        },
    })
    use_with_config("andymass/vim-matchup", "matchup") -- improves %, now with treesitter

    -- registers
    use_with_config("svermeulen/vim-subversive", "subversive") -- adds substitute operator
    -- use_with_config("svermeulen/vim-cutlass", "cutlass") -- separates cut and delete operations
    -- use_with_config("svermeulen/vim-yoink", "yoink") -- improves paste

    -- additional functionality
    use("ggandor/lightspeed.nvim") -- motion
    use_with_config("hrsh7th/vim-vsnip", "vsnip") -- snippets
    use({
        "hrsh7th/nvim-cmp", -- completion
        requires = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-vsnip",
            "hrsh7th/cmp-path",
        },
        config = config("cmp"),
    })
    use({"tzachar/cmp-tabnine", run="./install.sh", requires = "hrsh7th/nvim-cmp", config = config("tabnine")})
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
    use("b0o/schemastore.nvim") -- simple access to json schemae
    use("onsails/lspkind-nvim") -- better formatting for nvim-cmp

    -- development
    use("jose-elias-alvarez/nvim-lsp-ts-utils") -- improve typescript experience
    use({
        "vuki656/package-info.nvim", -- manage package.json
        config = config("package-info"),
        requires = "MunifTanjim/nui.nvim",
        ft = { "json" },
    })

    -- treesitter
    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = config("treesitter"),
    })
    use({
        "RRethy/nvim-treesitter-textsubjects", -- adds smart text objects
        ft = { "lua", "typescript", "typescriptreact" },
    })
    use({ "windwp/nvim-ts-autotag", ft = { "typescript", "typescriptreact" } }) -- automatically close jsx tags
    use({ "JoosepAlviste/nvim-ts-context-commentstring", ft = { "typescript", "typescriptreact" } }) -- makes jsx comments actually work

    -- visual
    use({ -- themes
        "sainnhe/sonokai",
        "rose-pine/neovim",
        "rmehri01/onenord.nvim",
        "EdenEast/nightfox.nvim",
        "folke/tokyonight.nvim",
        "sainnhe/edge",
    })
    use_with_config("nvim-lualine/lualine.nvim", "lualine") -- statusline and tabline
    use {
        'kdheepak/tabline.nvim',
        config = config("tabline"),
        requires = { { 'nvim-lualine/lualine.nvim', opt=true }, {'kyazdani42/nvim-web-devicons', opt = true} }
    }
    use("moll/vim-bbye") -- proper close buffer command

    -- misc
    use({ -- additional language support
        "teal-language/vim-teal",
        "hjson/vim-hjson",
    })
    use("nvim-lua/plenary.nvim") -- required for plugins, testing, and more
    use({
        "iamcco/markdown-preview.nvim", -- preview markdown output in browser
        opt = true,
        ft = { "markdown" },
        config = "vim.cmd[[doautocmd BufEnter]]",
        run = "cd app && yarn install",
        cmd = "MarkdownPreview",
    })
    use_with_config("nathom/filetype.nvim", "filetype") -- greatly reduce startup time
end)
