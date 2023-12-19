local M = {}

-- function to bootstrap lazy.nvim
function M.bootstrap()
    local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
    if not vim.loop.fs_stat(lazypath) then
        vim.fn.system({
            "git",
            "clone",
            "--filter=blob:none",
            "https://github.com/folke/lazy.nvim.git",
            "--branch=stable", -- latest stable release
            lazypath,
        })
    end
    vim.opt.rtp:prepend(lazypath)
end

function M.install()
    require('lazy').setup({
        { import = 'config.plugins.colorscheme' },
        { import = 'config.plugins.lsp' },
        { import = 'config.plugins.lsp.nvim-cmp' },
        { import = 'config.plugins.util' },
    })
end

return M
