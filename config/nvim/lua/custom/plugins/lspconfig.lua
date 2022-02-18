local M = {}

local map = require("core.utils").map

M.setup_lsp = function(attach, capabilities)
   local lspconfig = require "lspconfig"

   -- lspconfig.tsserver.setup {
   --    on_attach = function(client, bufnr)
   --       client.resolved_capabilities.document_formatting = false
   --       vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>fm", "<cmd>lua vim.lsp.buf.formatting()<CR>", {})
   --    end,
   -- }

   -- lspservers with default config

   for _, lsp in ipairs { "html", "bashls", } do
      lspconfig[lsp].setup {
         on_attach = attach,
         capabilities = capabilities,
         flags = {
            debounce_text_changes = 150,
         },
      }
   end

   on_attach_clangd = function(client, bufnr)
      -- Run nvchad's attach
      attach(client, bufnr)
      map("n", "<leader>a", ":ClangdSwitchSourceHeader<cr>")
   end

   lspconfig["clangd"].setup {
      on_attach = on_attach_clangd,
      capabilities = capabilities,
      flags = {
         debounce_text_changes = 150,
      },
   }

   on_attach_pyright = function(client, bufnr)
      -- Run nvchad's attach
      attach(client, bufnr)
   end

   lspconfig["pyright"].setup {
      on_attach = on_attach_clangd,
      capabilities = capabilities,
      flags = {
         debounce_text_changes = 150,
      },
   }
end

return M

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
--      if server.name == 'clangd' then
--        opts.on_attach = function(client, bufnr)
--            -- client.resolved_capabilities.document_formatting = false
--            -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>fm", "<cmd>lua vim.lsp.buf.formatting()<CR>", {})
--          vim.api.nvim_buf_set_keymap("n", "<leader>a", ":ClangdSwitchSourceHeader<CR>", { noremap = true, silent = true })
--          end,
--     else
--        opts.on_attach = function(client, bufnr)
--          end,
--      end
--
--       -- opts.on_attach = function(client, bufnr)
--       --    local function buf_set_keymap(...)
--       --       vim.api.nvim_buf_set_keymap(bufnr, ...)
--       --    end
--       --
--       --    -- Run nvchad's attach
--       --    attach(client, bufnr)
--       --
--       --    buf_set_keymap("n", "<leader>a", ":ClangdSwitchSourceHeader<CR>", { noremap = true, silent = true })
--       --    vim.cmd [[
--       --       augroup lsp_buf_format
--       --           au! BufWritePre <buffer>
--       --           autocmd BufWritePre <buffer> :lua vim.lsp.buf.formatting_sync()
--       --       augroup END
--       --    ]]
--       --
--       -- end
--
--       server:setup(opts)
--       vim.cmd [[ do User LspAttachBuffers ]]
--    end)
-- end
--
-- return M
