local M = {}

function M.telescope(builtin, opts)
    local params = { builtin = builtin, opts = opts }
    return function()
        builtin = params.builtin
        if builtin == "files" then
            builtin = "find_files"
        end
        require("telescope.builtin")[builtin](opts)
    end
end

function M.git(opts)
    return function()
        require('neogit').open(opts)
    end
end

return M
