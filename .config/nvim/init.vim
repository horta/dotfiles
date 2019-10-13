" Plugins {{{
call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'justinmk/vim-dirvish'
Plug 'bfredl/nvim-miniyank'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'thaerkh/vim-workspace'
Plug 'dag/vim-fish'
Plug 'kana/vim-altr'
Plug 'drmikehenry/vim-headerguard'
Plug 'moll/vim-bbye'
Plug 'janko-m/vim-test'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'wellle/targets.vim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'mg979/vim-visual-multi'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-pandoc'
Plug 'simeji/winresizer'
Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh \| UpdateRemotePlugins' }
Plug 'cespare/vim-toml'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'lervag/vimtex'
call plug#end()
" }}}

" Initialization {{{
" Avoid some loadings
let g:loaded_rrhelper = 1
let g:did_install_default_menus = 1
" Disable netrw, but autoload it for `gx`.
let g:loaded_netrwPlugin = 0
nmap gx <Plug>NetrwBrowseX
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#BrowseX(expand((exists("g:netrw_gx")? g:netrw_gx : '<cfile>')),netrw#CheckIfRemote())<CR>

let mapleader="\<space>"

" Allow buffer switching even if unsaved
set hidden

" Screen won't redraw while executing macros/etc that have not been typed
set lazyredraw

" Time to wait for
set timeoutlen=1000 " mapped sequence to complete
set ttimeoutlen=0 " a key code sequence to complete

set mouse=ar

set backupdir=~/.cache/nvim/backup
set directory=~/.cache/nvim/backup
set undodir=~/.cache/nvim/undo

set completeopt=noinsert,menuone,noselect

" Ignoring files
set wildignore+=*.pyc,*.o,*.obj,*/.git/*,*/__pycache__/*,*.npy,*.npz,*/.ccls-cache/*
set wildignore+=*/.git/*,*.swp,*.zip,*.pdf

" Keep the cursor at the same place when using *
nnoremap * *``

" Do not wrap lines
set nowrap

" Always show signcolumns
set signcolumn=yes

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=200

" Don't give |ins-completion-menu| messages.
set shortmess+=c

" Better display for messages
set cmdheight=2

" Case-insensitive searching
set ignorecase
" but become case-sensitive if you type uppercase characters
set smartcase

set nospell

let g:python3_host_prog = "/Users/horta/anaconda3/bin/python3"

" Disable Ex mode
nnoremap Q <Nop>
" }}}

" Window resize {{{
let g:winresizer_vert_resize = 1
let g:winresizer_horiz_resize = 1
let g:winresizer_start_key = '<C-E>'
" }}}

" Tab completion {{{
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
" }}}

" Mapping {{{
" Disable highlights
nmap <silent> <leader><space> :noh<CR>

" Save via <c-s>
noremap <silent> <c-s> :w<cr>:noh<cr>
inoremap <silent> <c-s> <esc>:w<cr>

" Substitute under cursor
nnoremap <leader>s :%s/\<<c-r><c-w>\>/<c-r><c-w>/gc<left><left><left>
exe 'source' '~/.config/nvim/lib/substitute.vim'
vnoremap <c-r> "hy:%sno/<c-r>=GetVisual()<cr>/<c-r>=GetVisual()<cr>/gc<left><left><left>

" File navigation
nnoremap <silent> <leader>d :Dirvish %:p:h<cr>
" nnoremap <silent> <leader>p :Files<cr>
nnoremap <silent> <leader>p :CocList files<cr>
" nnoremap <silent> <leader>f :Ag<cr>
nnoremap <silent> <leader>f :CocList grep<cr>

" Workspace
" nnoremap <leader>w :ToggleWorkspace<cr>

" Buffer switching
nnoremap <silent> <c-n> :bnext<cr>
nnoremap <silent> <c-p> :bprev<cr>
tnoremap <silent> <c-n> <c-\><c-n>:bnext<cr>
tnoremap <silent> <c-p> <c-\><c-n>:bprev<cr>

" Window switching
noremap <silent> <c-h> :wincmd h<cr>
noremap <silent> <c-j> :wincmd j<cr>
noremap <silent> <c-k> :wincmd k<cr>
noremap <silent> <c-l> :wincmd l<cr>

exe 'source' '~/.config/nvim/lib/buffers.vim'
" Delete current buffer
nnoremap <silent> <leader>c :Bdelete<cr>
" Delete all hidden buffers
nnoremap <silent> <leader>C :call DeleteHiddenBuffers()<cr>

" Modifies commands from tpope/vim-eunuch
" to use Bdelete command from moll/vim-bbye.
command! -bar -bang Remove Unlink<bang> | Bdelete
command! -bar -bang Delete Unlink<bang> | Bdelete

" Switch header/source files
command! A call altr#forward()

let g:VM_maps = {}
let g:VM_maps['Find Under']         = '<C-t>' " replace C-n
let g:VM_maps['Find Subword Under'] = '<C-t>' " replace visual C-n
" }}}

" Airline {{{
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#ignore_bufadd_pat = '!|defx|gundo|nerd_tree|startify|tagbar|undotree|vimfiler'
" }}}

" Python tester {{{
let test#python#runner = 'pytest'
nmap <silent> <leader>tn :TestNearest<cr>
nmap <silent> <leader>tf :TestFile<cr>
nmap <silent> <leader>ts :TestSuite<cr>
nmap <silent> <leader>tl :TestLast<cr>
nmap <silent> <leader>tg :TestVisit<cr>
" }}}

" Latex specific {{{
let g:tex_flavor  = 'latex'
let g:tex_conceal = ''
let g:vimtex_fold_manual = 1
let g:vimtex_latexmk_continuous = 1
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_view_method = 'skim'
let g:vimtex_format_enabled = 1
" let g:vimtex_indent_enabled = 0
" let g:vimtex_indent_delims = 0
" let g:vimtex_indent_ignored_envs = 1
" let g:vimtex_indent_lists = 1
" let g:vimtex_indent_on_ampersands = 0

augroup filetype_tex
  autocmd FileType tex
        \ autocmd! filetype_tex BufWritePost <buffer> call TrimWhitespace()
  " use 4 spaces for tabs
  set expandtab
  set tabstop=2
  set softtabstop=2
  set shiftwidth=2
  set shiftround
  set textwidth=100
  nmap <silent> <leader>v :VimtexView<cr>
  autocmd BufReadPre *.tex let b:vimtex_main = 'main.tex'
augroup END
" }}}

" Coc plugin {{{
" Use H to show documentation in preview window
nnoremap <silent> <leader>h :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

let g:coc_node_path = "/usr/local/bin/node"

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')
nmap <silent> <F5> :Format<cr>
" }}}

" C/C++ debugging {{{
let g:nvimgdb_disable_start_keymaps = 1

let g:nvimgdb_config_override = {
  \ 'key_frameup':    '<Nop>',
  \ 'key_framedown':  '<Nop>',
  \ }
" }}}

" Theme {{{
highlight link ErrorMsg GruvboxRed

colorscheme gruvbox
set background=dark
set noshowmode
set number
set cursorline
set scrolloff=4
" Shows the effects of a command incrementally
set inccommand=nosplit
set splitright
set splitbelow
" }}}

" Workspace {{{
" let g:workspace_session_directory = $HOME . '/.nvim/sessions/'
" let g:workspace_undodir = $HOME . '/.nvim/sessions/undo/'
" let g:workspace_autocreate = 1
" let g:workspace_session_disable_on_args = 1
" let g:workspace_autosave = 0
" let g:workspace_autosave_ignore = ['gitcommit', 'dirvish']
" }}}

" Trim whitespaces {{{
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
command! TrimWhitespace call TrimWhitespace()
" }}}

" Copy & paste {{{
let g:clipboard = {'copy': {'+': 'pbcopy', '*': 'pbcopy'},
            \ 'paste': {'+': 'pbpaste', '*': 'pbpaste'},
            \ 'name': 'pbcopy', 'cache_enabled': 0}
set clipboard^=unnamed,unnamedplus
" Smart paste
map p <Plug>(miniyank-autoput)
map P <Plug>(miniyank-autoPut)
" }}}

" Pandoc {{{
let g:pandoc#spell#enabled = 0
let g:pandoc#syntax#codeblocks#embeds#langs = ['c', 'python']
" }}}

" Terminal {{{
"
" Terminal mapping
tnoremap <esc> <c-\><c-n>

augroup filetype_term
    autocmd!
    autocmd TermOpen * setlocal nonumber norelativenumber signcolumn=no
augroup END
" }}}

" File types {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType vim
        \ autocmd! filetype_vim BufWritePost <buffer> call TrimWhitespace()
augroup END

augroup filetype_c
    autocmd!
    autocmd FileType c setlocal foldmethod=syntax foldnestmax=1
      \ foldenable foldlevel=99
augroup END

augroup filetype_rust
    autocmd!
    autocmd FileType rust setlocal foldmethod=syntax foldnestmax=1
      \ foldenable foldlevel=99
    autocmd FileType rust
        \ autocmd! filetype_rust BufWritePost <buffer> call TrimWhitespace()
augroup END

augroup filetype_pandoc
    autocmd!
    autocmd FileType pandoc setlocal foldnestmax=4
      \ foldenable foldlevel=99
    autocmd FileType pandoc
        \ autocmd! filetype_pandoc BufWritePost <buffer> call TrimWhitespace()
augroup END

augroup filetype_rst
    autocmd!
    autocmd FileType rst setlocal foldnestmax=4
      \ foldenable foldlevel=99
    autocmd FileType rst
        \ autocmd! filetype_rst BufWritePost <buffer> call TrimWhitespace()
augroup END

augroup filetype_yaml
    autocmd!
    autocmd FileType yaml
        \ autocmd! filetype_yaml BufWritePost <buffer> call TrimWhitespace()
augroup END

augroup filetype_text
    autocmd FileType text
        \ autocmd! filetype_text BufWritePost <buffer> call TrimWhitespace()
augroup END

augroup dirvish_config
    autocmd!
    autocmd FileType dirvish silent! nmap <buffer> <del> <nop>
    autocmd FileType dirvish silent! nmap <buffer> <backspace> <nop>
    autocmd FileType dirvish silent! nmap <buffer> x <nop>
augroup END
" }}}

" Edit git commit
autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" set conceallevel=0

" Default fzf layout
let g:fzf_layout = { 'down': '~20%' }

" Python breakpoint
nnoremap <silent> <leader>bp Obreakpoint()<esc>:w<esc>
