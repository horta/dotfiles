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
    options = {
        lspconfig = {
            setup_lspconf = "custom.plugins.lspconfig",
        },
    },
}

M.mappings = {
    terminal = {
        esc_termmode = { "<esc>" },
    },
}

M.mappings.plugins = {
    bufferline = {
        next_buffer = "<c-n>",
        prev_buffer = "<c-p>",
    },
    lspconfig = {
        declaration = "gD",
        definition = "gd",
        hover = "K",
        implementation = "gi",
        signature_help = "gk",
        add_workspace_folder = "<leader>wa",
        remove_workspace_folder = "<leader>wr",
        list_workspace_folders = "<leader>wl",
        type_definition = "<leader>D",
        rename = "<leader>rn",
        code_action = "<leader>ca",
        references = "gr",
        float_diagnostics = "ge",
        goto_prev = "[d",
        goto_next = "]d",
        set_loclist = "<leader>q",
        formatting = "<leader>fm",
    },
    nvimtree = {
        toggle = {},
        focus = {},
    },
}

return M
