local null_ls = require("null-ls")
local b = null_ls.builtins

local sources = {
    b.formatting.prettier.with({
        filetypes = { "html", "css", "scss", "json", "yaml", "markdown", "toml" },
    }),
    b.formatting.stylua.with({
        condition = function(utils)
            return utils.root_has_file("stylua.toml")
        end,
    }),
    b.formatting.trim_whitespace.with({ filetypes = { "tmux", "teal", "zsh" } }),
    b.formatting.shfmt,
    b.formatting.rustfmt,
    b.formatting.gofmt,
    b.formatting.goimports, -- updates Go import lines, adding missing ones and removing unreferenced ones
    b.formatting.black,
    b.diagnostics.write_good,
    b.diagnostics.markdownlint,
    b.diagnostics.teal,
    b.diagnostics.shellcheck.with({ diagnostics_format = "#{m} [#{c}]" }),
    b.code_actions.gitsigns,
    b.hover.dictionary,
}

local M = {}
M.setup = function(on_attach)
    null_ls.config({
        -- debug = true,
        sources = sources,
    })
    require("lspconfig")["null-ls"].setup({ on_attach = on_attach })
end

return M
