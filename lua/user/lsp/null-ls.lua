local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
    return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

-- https://github.com/prettier-solidity/prettier-plugin-solidity
null_ls.setup {
    debug = false,
    tmp_dir = "/tmp",
    sources = {
        formatting.prettier.with {
            extra_filetypes = { "toml" },
        },
        diagnostics.phpstan,
        formatting.phpcsfixer.with {
            condition = function(utils)
                return utils.root_has_file { ".php-cs-fixer.dist.php", ".php-cs-fixer.php" }
            end,
        },
        formatting.pint.with {
            condition = function(utils)
                return utils.root_has_file { "artisan",  }
            end,
            temp_dir = "/tmp",
        },
        formatting.stylua.with {},
    },
}
