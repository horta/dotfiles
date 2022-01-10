--
-- local M = {}
--
-- M.setup_lsp = function(attach, capabilities)
--    local lsp_installer = require "nvim-lsp-installer"
--
--    lsp_installer.on_server_ready(function(server)
--       local opts = {
--          on_attach = attach,
--          capabilities = capabilities,
--          flags = {
--             debounce_text_changes = 150,
--          },
--          settings = {},
--       }
--
--       opts.on_attach = function(client, bufnr)
--          local function buf_set_keymap(...)
--             vim.api.nvim_buf_set_keymap(bufnr, ...)
--          end
--
--          -- Run nvchad's attach
--          attach(client, bufnr)
--
--          buf_set_keymap("n", "<leader>a", ":ClangdSwitchSourceHeader<CR>", { noremap = true, silent = true })
--          vim.cmd [[
--             augroup lsp_buf_format
--                 au! BufWritePre <buffer>
--                 autocmd BufWritePre <buffer> :lua vim.lsp.buf.formatting_sync()
--             augroup END
--          ]]
--
--       end
--
--       server:setup(opts)
--       vim.cmd [[ do User LspAttachBuffers ]]
--    end)
-- end
--
-- return M

local M = {}

M.setup_lsp = function(attach, capabilities)
    local lsp_installer = require "nvim-lsp-installer"

    lsp_installer.on_server_ready(function(server)
        local opts = {
            on_attach = attach,
            capabilities = capabilities,
            flags = {
                debounce_text_changes = 150,
            },
            settings = {},
        }

        opts.on_attach = function(client, bufnr)
            -- Run nvchad's attach
            attach(client, bufnr)
        end

        server:setup(opts)
        vim.cmd [[ do User LspAttachBuffers ]]
    end)
end

return M
