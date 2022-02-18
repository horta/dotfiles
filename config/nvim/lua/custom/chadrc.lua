local M = {}

local userPlugins = require "custom.plugins"

M.options = {
   nvChad = {
      window_nav = true,
   },
   expandtab = true,
   shiftwidth = 4,
   tabstop = 4,
}

M.ui = {
   theme = "aquarium",
}

M.plugins = {
   status = { nvimtree = false, blankline = false, colorizer = true },

   options = {
      lspconfig = {
         setup_lspconf = "custom.plugins.lspconfig",
      },
   },

   install = userPlugins,
}

M.mappings = {
   misc = {
      close_buffer = "<c-x>",
   },
   terminal = {
      esc_termmode = { "<esc>" },
   },
}

M.mappings.plugins = {
   bufferline = {
      next_buffer = "<c-n>",
      prev_buffer = "<c-p>",
   },
   nvimtree = {
      toggle = {},
      focus = {},
   },
   lspconfig = {
      add_workspace_folder = {},
      remove_workspace_folder = {},
      list_workspace_folders = {},
   },
}

return M
