function _setup()
    local lspconfig = require('lspconfig')

    lspconfig.lua_ls.setup({
        settings = {
            Lua = {
                completion = {
                    callSnippet = true,
                },
            },
        },
    })
end

return {
    {
        "williamboman/mason.nvim",
        event = VeryLazy,
        config = true,
        opts = {
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                },
                border = "single"
            }
        },
    },
    {
        "williamboman/mason-lspconfig.nvim",
        event = VeryLazy,
        config = function()
            _setup()
        end,
        opts = {
            ensure_installed = { "lua_ls", "rust_analyzer" },
        }
    }
}
