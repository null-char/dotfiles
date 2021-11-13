require("nvim-treesitter.configs").setup({
    highlight = { enable = true },
    ensure_installed = {
        "javascript",
        "typescript",
        "tsx",
        "lua",
        "json",
        "jsonc",
        "yaml",
        "toml",
        "rust",
        "go",
        "python",
        "fish",
        "css",
        "scss",
    },
    -- plugins
    autopairs = { enable = true },
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },
    textsubjects = {
        enable = true,
        keymaps = {
            ["."] = "textsubjects-smart",
            [";"] = "textsubjects-container-outer",
        },
    },
    autotag = {
        enable = true,
    },
})

require("nvim-treesitter.install").compilers = { "gcc" }
