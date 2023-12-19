return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        config = function()
            require('nvim-treesitter.configs').setup({
                highlight = { enable = true },
                indent = { enable = true },
                ensure_installed = {
                    "c",
                    "lua",
                    "markdown",
                    "markdown_inline",
                    "vim",
                    "vimdoc",
                    "yaml",
                },
            })
        end,
    }
}
