local M = {}

M.setup_lsp = function(attach, capabilities)
   local lspconfig = require "lspconfig"

   lspconfig.tsserver.setup {
      on_attach = function(client, bufnr)
         client.resolved_capabilities.document_formatting = false
         vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>fm", "<cmd>lua vim.lsp.buf.formatting()<CR>", {})
      end,
   }

   -- lspservers with default config
   local servers = { "html", "cssls", "bashls", "clangd" }

   for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup {
         on_attach = attach,
         capabilities = capabilities,
         flags = {
            debounce_text_changes = 150,
         },
      }
   end

   -- lua lsp!
   local sumneko_root_path = "/home/sid/test/sumneko_lua"
   local sumneko_binary = sumneko_root_path .. "/bin/lua-language-server"

   lspconfig.sumneko_lua.setup {
      cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
      on_attach = attach,
      capabilities = capabilities,
      settings = {
         Lua = {
            diagnostics = {
               globals = { "vim" },
            },
            workspace = {
               library = {
                  [vim.fn.expand "$VIMRUNTIME/lua"] = true,
                  [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
               },
               maxPreload = 100000,
               preloadFileSize = 10000,
            }
         },
      },
   }
end

return M

-- local M = {}
--
-- M.setup_lsp = function(attach, capabilities)
--     local lsp_installer = require "nvim-lsp-installer"
--
--     lsp_installer.on_server_ready(function(server)
--         local opts = {
--             on_attach = attach,
--             capabilities = capabilities,
--             flags = {
--                 debounce_text_changes = 150,
--             },
--             settings = {},
--         }
--
--         opts.on_attach = function(client, bufnr)
--             -- Run nvchad's attach
--             attach(client, bufnr)
--         end
--
--         server:setup(opts)
--         vim.cmd [[ do User LspAttachBuffers ]]
--     end)
-- end
--
-- return M
--
-- require("plugins.configs.others").lsp_handlers()
--
-- local function on_attach(_, bufnr)
--     local function buf_set_option(...)
--         vim.api.nvim_buf_set_option(bufnr, ...)
--     end
--
--     -- Enable completion triggered by <c-x><c-o>
--     buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
--     require("core.mappings").lspconfig()
-- end
--
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- local lsp_installer = require "nvim-lsp-installer"
--
-- lsp_installer.settings {
--     ui = {
--         icons = {
--             server_installed = "﫟",
--             server_pending = "",
--             server_uninstalled = "✗",
--         },
--     },
-- }
--
-- lsp_installer.on_server_ready(function(server)
--     -- server options, so default options for all servers
--     local opts = {
--         on_attach = on_attach,
--         capabilities = capabilities,
--         flags = {
--             debounce_text_changes = 150,
--         },
--         settings = {},
--     }
--
--     server:setup(opts)
--     vim.cmd [[ do User LspAttachBuffers ]]
-- end)
