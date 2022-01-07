local M = {}

M.options = {
    nvChad = {
        window_nav = false,
    },
}

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
