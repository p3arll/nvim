local function setup()
  local api = vim.api
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next)

  api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
      local opts = { buffer = ev.buf }
      vim.keymap.set('n', '<leader>gd', vim.lsp.buf.declaration, opts)
      vim.keymap.set('n', '<leader>gf', vim.lsp.buf.definition, opts)
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
      vim.keymap.set('n', '<leader>i', vim.lsp.buf.implementation, opts)
      vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
      vim.keymap.set('n', '<leader>lwa', vim.lsp.buf.add_workspace_folder, opts)
      vim.keymap.set('n', '<leader>lwr', vim.lsp.buf.remove_workspace_folder, opts)
      vim.keymap.set('n', '<leader>td', vim.lsp.buf.type_definition, opts)
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
      vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
      vim.keymap.set('n', '<leader>rf', vim.lsp.buf.references, opts)
      vim.keymap.set('n', '<leader>lf', function()
        vim.lsp.buf.format { async = true }
      end, opts)
    end,
  })
  local fmtGroup = api.nvim_create_augroup('fmtGroup', { clear = true, })
  api.nvim_create_autocmd('BufWritePre', {
    group = fmtGroup,
    callback = function()
      vim.lsp.buf.format {
        async = false,
      }
    end
  })

  -- Hide all semantic highlights
  for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
    vim.api.nvim_set_hl(0, group, {})
  end

  local servers = {
    "clangd",
    "rust_analyzer",
    "lua_ls",
    "fennel_language_server",
    "clojure_lsp"
  }

  for _, server in ipairs(servers) do
    require('lspconfig')[server].setup({})
  end
end

return {
  {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      setup()
    end
  }

}
