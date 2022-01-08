local M = {}

M.options = {
    nvChad = {
        window_nav = false,
    },
    expandtab = true,
    shiftwidth = 4,
    tabstop = 4,
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
