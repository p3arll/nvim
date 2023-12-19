function _setup()
  local cmp = require('cmp')
  cmp.setup({
    experimental = {
      ghost_text = false,
    },

    enabled = function()
      local ctx = require('cmp.config.context')
      if vim.api.nvim_get_mode().mode == 'c' then
        return true
      else
        return not ctx.in_treesitter_capture('comment')
            and not ctx.in_syntax_group('Comment')
      end
    end,

    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },

    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },

    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-a>'] = cmp.mapping.abort(),
      ['<Tab>'] = cmp.mapping.confirm({ select = true, }),
    }),

    sources = cmp.config.sources({
      { name = 'nvim_lsp', },
      { name = 'luasnip', },
    }, {
      { name = 'buffer', },
    }),
  })

  local autopairs = require('nvim-autopairs.completion.cmp')
  cmp.event:on(
    'confirm_done',
    autopairs.on_confirm_done()
  )

  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' },
    }, {
      { name = 'cmdline' },
    })
  })

  local servers = {
    "clangd",
    "rust_analyzer",
    "lua_ls",
    "fennel_language_server",
    "clojure_lsp"
  }

  for _, server in ipairs(servers) do
    require('lspconfig')[server].setup({
      capabilities = require('cmp_nvim_lsp').default_capabilities()
    })
  end
end

return {
  {
    'hrsh7th/nvim-cmp',
    event = InsertEnter,
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      {
        'windwp/nvim-autopairs',
        event = InsertEnter,
        config = true,
      },
    },
    config = function()
      _setup()
    end,
  },
}
