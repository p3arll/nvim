return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = false,
    priority = 1000,
    dependencies = {
      {
        'xiyaowong/transparent.nvim',
        lazy = false,
        priority = 1000,
        config = true,
      }
    },
    config = function()
      -- vim.cmd([[colorscheme everforest]])
      vim.cmd([[colorscheme oxocarbon]])
    end
  },
  {
    'nyoom-engineering/oxocarbon.nvim',
    lazy = false,
    priority = 1000,
  },
  {
    'sainnhe/everforest',
    lazy = false,
    priority = 1000,
  }
}
