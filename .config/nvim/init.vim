call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-commentary'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Chiel92/vim-autoformat'
Plug 'justinmk/vim-dirvish'
Plug 'wellle/tmux-complete.vim'
Plug 'tpope/vim-eunuch'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'bfredl/nvim-miniyank'
Plug 'itchyny/lightline.vim'
Plug 'thaerkh/vim-workspace'
Plug 'dag/vim-fish'
Plug 'kana/vim-altr'
" Plug 'mg979/vim-visual-multi'
Plug 'drmikehenry/vim-headerguard'
Plug 'ap/vim-buftabline'
Plug 'rizzatti/dash.vim'
Plug 'moll/vim-bbye'
Plug 'Shougo/denite.nvim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'janko-m/vim-test'
Plug 'airblade/vim-gitgutter'
call plug#end()

let mapleader="\<space>"

" avoid stupid menu.vim (saves ~100ms)
let g:did_install_default_menus = 1
" Allow buffer switching even if unsaved
set hidden
" Disable netrw
let g:loaded_netrwPlugin = 0
" Use deoplete.
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('auto_complete_delay', 300)
" Speed up
set lazyredraw
set mouse=a
set timeoutlen=1000 ttimeoutlen=0

" Terminal mappings
tnoremap <Esc> <C-\><C-n>

" Theme / Screen
colorscheme gruvbox
set background=dark
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }
set termguicolors
set number
set cursorline
set scrolloff=7
set inccommand=nosplit
set splitright
set splitbelow
let &colorcolumn=join(range(89,9999),",")

" Format
set tabstop=4
set shiftwidth=4
set expandtab

" <TAB>: completion
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
nnoremap <silent> <C-N> :bnext<CR>
nnoremap <silent> <C-P> :bprev<CR>
set completeopt=noinsert,menuone,noselect


" Backup
set backupdir=~/.cache/nvim/backup
set directory=~/.cache/nvim/backup
set undodir=~/.cache/nvim/undo

" General shortcuts
nnoremap <silent> <leader>r :source $MYVIMRC<cr>
nnoremap <silent> <leader>h :noh<cr>
noremap <silent> <c-s> :w<cr>
inoremap <silent> <c-s> <esc>:w<cr>
if !exists(":Q")
    :command Q Bdelete
endif

" Substitute under cursor
nnoremap <leader>s :%s/\<<c-r><c-w>\>/<c-r><c-w>/gc<left><left><left>
vnoremap <C-r> "hy:%sno/<c-r>h/<c-r>h/gc<left><left><left>

" Python stuff
nnoremap <silent> <leader>bp Obreakpoint()<esc>:w<esc>

" Session
nnoremap <leader>w :ToggleWorkspace<cr>
let g:workspace_session_directory = $HOME . '/.vim/sessions/'
let g:workspace_autocreate = 1
let g:workspace_session_disable_on_args = 1
let g:workspace_autosave = 0
let g:workspace_autosave_ignore = ['gitcommit', 'dirvish']

" File navigation
nnoremap <silent> <leader>d :Dirvish %:p:h<cr>
nnoremap <silent> <leader>p :Files<cr>
nnoremap <silent> <leader>f :Ag<cr>

" Formatting
au BufWrite * :Autoformat
au BufRead,BufNewFile *.rst setlocal textwidth=88
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 1
let g:formatters_python = []

" Language Server
let g:LanguageClient_serverCommands = {
    \ 'python': ['/usr/local/anaconda3/bin/pyls', '--log-file', '/Users/horta/pyls.log', '-v'],
    \ 'cpp': ['cquery', '--log-file=/tmp/cq.log'],
    \ 'c': ['cquery', '--log-file=/tmp/cq.log'],
    \ 'sh': ['bash-language-server', 'start'],
    \ }
" set completefunc=LanguageClient#complete
set formatexpr=LanguageClient_textDocument_rangeFormatting()
set formatoptions+=w
set signcolumn=yes
hi clear ALEError
hi clear ALEWarning
hi clear ALEInfo
" Use an absolute configuration path if you want system-wide settings
let g:LanguageClient_loadSettings = 1
let g:LanguageClient_settingsPath = '/Users/horta/.config/nvim/settings.json'
nnoremap <silent> <leader>lf :call LanguageClient_textDocument_formatting()<cr>
autocmd FileType python,c,cpp nnoremap <silent> <buffer>
  \ <leader>ld :call LanguageClient_textDocument_definition()<cr>
autocmd FileType python,c,cpp nnoremap <silent> <buffer>
  \ <leader>li :call LanguageClient_textDocument_implementation()<cr>
autocmd FileType python,c,cpp nnoremap <silent> <buffer>
  \ <leader>lh :call LanguageClient_textDocument_hover()<cr>
autocmd FileType python,c,cpp nnoremap <silent> <buffer>
  \ <leader>lr :call LanguageClient_textDocument_rename()<cr>
nnoremap <leader>t :!cd build ;and cmake .. ;and make ;and ctest<cr>
nn <leader>ji :Denite documentSymbol<cr>
nn <leader>jI :Denite workspaceSymbol<cr>

" Copy / paste
let g:clipboard = {'copy': {'+': 'pbcopy', '*': 'pbcopy'},
            \ 'paste': {'+': 'pbpaste', '*': 'pbpaste'},
            \ 'name': 'pbcopy', 'cache_enabled': 0}
set clipboard+=unnamedplus
map p <Plug>(miniyank-autoput)
map P <Plug>(miniyank-autoPut)

" Ignoring files
set wildignore=*.pyc,*.o,*.obj

command! A call altr#forward()

autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" vim-visual-multi
" let g:VM_maps = {}
" let g:VM_maps['Find Under']         = '<A-n>'           " replace C-n
" let g:VM_maps['Find Subword Under'] = '<A-n>'           " replace visual C-n
" let g:VM_maps["Select l"]           = '<S-Right>'       " start selecting left
" let g:VM_maps["Select h"]           = '<S-Left>'        " start selecting right

" Folding
set foldnestmax=1
" set foldmethod=syntax
set nofoldenable

" Buffers
if !exists("*DeleteHiddenBuffers")
function DeleteHiddenBuffers()
    let tpbl=[]
    call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
    for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
        silent execute 'bwipeout' buf
    endfor
endfunction
nnoremap <silent> <leader>c :call DeleteHiddenBuffers()<cr>
endif


function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

" Test
nmap <silent> <leader>tn :TestNearest<cr>
nmap <silent> <leader>tf :TestFile<cr>
nmap <silent> <leader>ts :TestSuite<cr>
nmap <silent> <leader>tl :TestLast<cr>
nmap <silent> <leader>tg :TestVisit<cr>
let test#python#runner = 'pytest'


nmap <silent> <leader>e :!%:p<cr>
