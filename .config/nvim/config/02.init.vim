" avoid stupid menu.vim (saves ~100ms)
let g:did_install_default_menus = 1

" Allow buffer switching even if unsaved
set hidden

" Speed up
set lazyredraw
set mouse=a
set timeoutlen=1000 ttimeoutlen=0

set backupdir=~/.cache/nvim/backup
set directory=~/.cache/nvim/backup
set undodir=~/.cache/nvim/undo

set completeopt=noinsert,menuone,noselect

" Folding
set foldnestmax=1
set nofoldenable

" Ignoring files
set wildignore+=*.pyc,*.o,*.obj,*/.git/*,*/__pycache__/*,*.npy,*.npz,*/.ccls-cache/*
set wildignore+=*/tmp/*,*.swp,*.zip,*.pdf

" Formatting
au BufRead,BufNewFile *.rst setlocal textwidth=88

" Keep the cursor at the same place when using *
nnoremap * *``

" Window resizer
let g:winresizer_vert_resize = 1
let g:winresizer_horiz_resize = 1

" Python tester
let test#python#runner = 'pytest'

" Edit git commit
autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" Copy / paste
let g:clipboard = {'copy': {'+': 'pbcopy', '*': 'pbcopy'},
            \ 'paste': {'+': 'pbpaste', '*': 'pbpaste'},
            \ 'name': 'pbcopy', 'cache_enabled': 0}
set clipboard+=unnamedplus

" Default fzf layout
let g:fzf_layout = { 'down': '~20%' }

" always show signcolumns
set signcolumn=yes

let g:nvimgdb_disable_start_keymaps = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
