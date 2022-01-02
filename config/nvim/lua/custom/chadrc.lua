-- This is an example chadrc file , its supposed to be placed in /lua/custom dir
-- lua/custom/chadrc.lua

local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
  theme = "gruvchad",
}

M.mappings.plugins = {
  bufferline = {
     next_buffer = "<c-n>",
     prev_buffer = "<c-p>",
  },
}

-- map("n", "<c-n>", "m.next_buffer")

return M
