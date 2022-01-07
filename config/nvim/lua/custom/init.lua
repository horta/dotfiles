local hooks = require "core.hooks"

hooks.add("setup_mappings", function(map)
    -- Keep it centered
    map("n", "n", "nzzzv")
    map("n", "N", "Nzzzv")

    -- vim.cmd([[unmap autocmd BufNewFile,BufRead *.h setlocal filetype=c]])
    map("n", "<leader>d", "<cmd>Dirvish %:p:h<cr>")

    -- turn off search highlighting
    map("n", "<leader><leader>", ":noh <CR>")

    map("n", "q", "<nop>")

    -- Keep selected text under cursor
    vim.cmd [[ nnoremap * :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR> ]]

    map("n", "<leader>ff", ":Telescope find_files <CR>")
    map("n", "<leader>p", ":Telescope find_files <CR>")

    map("n", "<leader>gg", ":LazyGit<CR>")
    map("n", "<leader>fm", "<cmd>lua vim.lsp.buf.formatting()<CR>")

    vim.cmd [[ let g:kitty_navigator_no_mappings = 1 ]]

    map("n", "<c-h>", ":KittyNavigateLeft<cr>")
    map("n", "<c-j>", ":KittyNavigateDown<cr>")
    map("n", "<c-k>", ":KittyNavigateUp<cr>")
    map("n", "<c-l>", ":KittyNavigateRight<cr>")

    -- vim.cmd("unmap <c-n>")
    -- vim.cmd("unmap <c-p>")

    -- vim.cmd("unmap <tab>")
    -- vim.cmd("unmap <s-tab>")
end)

hooks.add("install_plugins", function(use)
    use {
        "williamboman/nvim-lsp-installer",
        config = function()
            local lsp_installer = require "nvim-lsp-installer"

            lsp_installer.on_server_ready(function(server)
                local opts = {}

                server:setup(opts)
                vim.cmd [[ do User LspAttachBuffers ]]
            end)
        end,
    }
    use { "justinmk/vim-dirvish", event = "VimEnter" }
    use { "wincent/scalpel", event = "BufRead" }
    use { "kdheepak/lazygit.nvim", event = "BufRead" }
    use { "blankname/vim-fish", event = "BufRead" }
    use {
        "jose-elias-alvarez/null-ls.nvim",
        event = "BufRead",
        config = function()
            require("null-ls").setup {
                sources = {
                    require("null-ls").builtins.formatting.stylua.with {
                        extra_args = { "--indent-width", "4" },
                    },
                    require("null-ls").builtins.formatting.shfmt.with {
                        extra_args = { "-i", "4", "-ci" },
                    },
                },
            }
        end,
    }
    use "knubie/vim-kitty-navigator"
end)

vim.cmd [[autocmd BufNewFile,BufRead *.h setlocal filetype=c]]
