return {
   {
      "jose-elias-alvarez/null-ls.nvim",
      after = "nvim-lspconfig",
      config = function()
         require("custom.plugins.null-ls").setup()
      end,
   },

   { "justinmk/vim-dirvish", event = "VimEnter" },
   { "tpope/vim-eunuch", event = "VimEnter" },
   { "wincent/scalpel", event = "BufRead" },
   { "blankname/vim-fish", event = "BufRead" },
   {
      "numToStr/FTerm.nvim",
      event = "BufRead",
      config = function()
         require("FTerm").setup {
            blend = 15,
         }
      end,
   },
   { "fedepujol/move.nvim" },
}
