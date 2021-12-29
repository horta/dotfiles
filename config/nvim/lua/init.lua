hooks.add("install_plugins", function(use)
   --    use {
   --       "max397574/better-escape.nvim",
   --       event = "InsertEnter",
   --    }
   use { "williamboman/nvim-lsp-installer" }
   use { "justinmk/vim-dirvish" }
   use { "wincent/scalpel" }
   use { "mhartington/formatter.nvim" }
   use { "folke/which-key.nvim" }
   use { "kdheepak/lazygit.nvim" }
end)
