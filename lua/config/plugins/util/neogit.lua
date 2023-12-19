local util = require('config.util')

return {
    {
        "NeogitOrg/neogit",
        event = VeryLazy,
        dependencies = {
            "sindrets/diffview.nvim",
            'nvim-lua/plenary.nvim',
        },
        config = function()
            require('neogit').setup()
        end,
        keys = {
            { '<leader>gc', util.git({ 'commit', kind = 'tab' }), {} },
            { '<leader>go', util.git({ kind = 'tab', }),          {} },
        },
    },
}
