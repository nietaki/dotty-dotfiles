set nocompatible

set showmatch
set autoindent
set smartindent

set hlsearch
:set ts=2
:set softtabstop=2
:set shiftwidth=2
:set laststatus=2

:filetype plugin indent on

"set ofu=syntaxcomplete#Complete
":set completeopt=longest,menuone
  
" " zamienianie tabow na spacje
:set expandtab
:set langmenu=en_US.UTF-8

map <Down> g<Down>
map <Up> g<Up>
nmap j gj
nmap k gk
vmap j gj
vmap k gk

"pasts
":map <C-p> :set  paste<CR>
:set pastetoggle=<C-p>

"z deva
syntax on

" highlight the line the cursor is in
set cursorline
