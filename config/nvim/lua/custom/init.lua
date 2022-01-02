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
end)


hooks.add("install_plugins", function(use)
   -- use {
   --    "max397574/better-escape.nvim",
   --    event = "InsertEnter",
   -- }

   use { "williamboman/nvim-lsp-installer",
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
   -- use { "mhartington/formatter.nvim" }
   -- use { "folke/which-key.nvim" }
   use { "kdheepak/lazygit.nvim", event = "BufRead" }
   use { "blankname/vim-fish", event = "BufRead" }
end)

vim.cmd [[autocmd BufNewFile,BufRead *.h setlocal filetype=c]]
