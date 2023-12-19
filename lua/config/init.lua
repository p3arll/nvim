local M = {}

M.opts = {
  tabstop = 2,
  shiftwidth = 2,
  number = true,
  relativenumber = true,
  wrap = false,
  autoindent = true,
  expandtab = true,
  ignorecase = true,
  termguicolors = true,
  list = true,
  listchars = "trail:·,extends:·,precedes:·,nbsp:·",
  guifont = "Iosevka Comfy:h18"
}

function M.setup()
  for opt, value in pairs(M.opts) do
    vim.opt[opt] = value
  end

  require('config.mappings').setup()

  local plugins = require('config.plugins')
  plugins.bootstrap()
  plugins.install()
  vim.cmd("cnoreabbrev Wq wq")
  vim.fn.sign_define("DiagnosticSignError",
    { text = " ", texthl = "DiagnosticSignError" })
  vim.fn.sign_define("DiagnosticSignWarn",
    { text = " ", texthl = "DiagnosticSignWarn" })
  vim.fn.sign_define("DiagnosticSignInfo",
    { text = " ", texthl = "DiagnosticSignInfo" })
  vim.fn.sign_define("DiagnosticSignHint",
    { text = "󰌵", texthl = "DiagnosticSignHint" })


  vim.g.netrw_banner = 0
  vim.g.netrw_liststyle = 3
  vim.g.netrw_browse_split = 4
  vim.g.netrw_winsize = 25
end

return M
