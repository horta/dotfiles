local M = {}

M.options = {}

M.ui = {
    theme = "gruvchad",
}

M.plugins = {
    status = { nvimtree = false, blankline = false },
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

return M
