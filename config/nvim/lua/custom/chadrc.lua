-- This is an example chadrc file , its supposed to be placed in /lua/custom dir
-- lua/custom/chadrc.lua

local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.options = {}

M.plugins = {
   status = { nvimtree = false },
}

M.mappings = {}

M.mappings.plugins = {
   nvimtree = {
      toggle = {},
      focus = {},
   },
   bufferline = {
      next_buffer = "<c-n>",
      prev_buffer = "<c-p>",
   },
}

M.ui = {
   theme = "gruvchad",
}

return M
