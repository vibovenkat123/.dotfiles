local M = {}
M.safe_load = function(module)
    package.loaded[module] = nil
    return require(module)
end

return M
