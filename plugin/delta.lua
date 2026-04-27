---@type Delta
setmetatable(_G, {
    __index = function(t, k)
        if k == 'Delta' then
            vim.notify(
                '[delta.lua] The Delta global is deprecated and will be removed in the near future. delta.lua is now lazy loaded. If you are using deltaview.nvim, please ensure you are using v0.2.2 or later. If you are a plugin consumer, please use require("delta") instead.',
                vim.log.levels.WARN
            )
            rawset(t, 'Delta', require('delta')) -- cache to suppress repeat warnings
            return require('delta')
        end
    end
})
