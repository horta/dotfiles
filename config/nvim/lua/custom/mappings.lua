local map = require("core.utils").map

-- Keep it centered
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

map("n", "<leader>d", "<cmd>Dirvish %:p:h<cr>")
map("n", "q", "<nop>")
map("n", "<leader>a", "<nop>")

-- Keep selected text under cursor
vim.cmd [[ nnoremap * :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR> ]]

map("n", "<leader>ff", ":Telescope find_files <CR>")
map("n", "<leader>p", ":Telescope find_files <CR>")

map("n", "<f10>", '<CMD>lua require("FTerm").toggle()<CR>')
map("t", "<f10>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')

map("n", "<A-j>", ":MoveLine(1)<CR>")
map("n", "<A-k>", ":MoveLine(-1)<CR>")
map("v", "<A-j>", ":MoveBlock(1)<CR>")
map("v", "<A-k>", ":MoveBlock(-1)<CR>")
map("n", "<A-l>", ":MoveHChar(1)<CR>")
map("n", "<A-h>", ":MoveHChar(-1)<CR>")
map("v", "<A-l>", ":MoveHBlock(1)<CR>")
map("v", "<A-h>", ":MoveHBlock(-1)<CR>")

map("n", "<leader>fi", "<nop>")
map("n", "<leader>fm", "<cmd>lua vim.lsp.buf.formatting()<CR>")
