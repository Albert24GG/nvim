---@type ChadrcConfig
local M = {}

local overrides = require("custom.configs.overrides")


M.ui = overrides.ui



M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require("custom.mappings")

return M
