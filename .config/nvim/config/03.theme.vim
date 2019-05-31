colorscheme gruvbox
set background=dark
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \   'active': {
      \     'left': [ [ 'mode', 'paste' ],
      \               [ 'gitbranch', 'readonly', 'filename', 'modified' ]
      \             ]
      \   },
      \   'component_function': {
      \     'gitbranch': 'fugitive#head'
      \   },
      \ }
set number
set cursorline
set scrolloff=7
set inccommand=nosplit
set splitright
set splitbelow
let &colorcolumn=join(range(89,9999),",")
