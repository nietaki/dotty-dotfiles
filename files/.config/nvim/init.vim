"using vim config
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

source ~/.vimrc


"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

syntax on

" Map the leader key to SPACE
let mapleader="\<SPACE>"

set showmatch           " Show matching brackets.
set number              " Show the line numbers on the left side.
set formatoptions+=o    " Continue comment marker in new lines.
set expandtab           " Insert spaces when TAB is pressed.
set tabstop=2           " Render TABs using this many spaces.
set shiftwidth=2        " Indentation amount for < and > commands.

set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)

" More natural splits
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.

if !&scrolloff
    set scrolloff=3       " Show next 3 lines while scrolling.
endif
if !&sidescrolloff
    set sidescrolloff=5   " Show next 5 columns while side-scrolling.
endif
set nostartofline       " Do not jump to first character with page commands.


" Tell Vim which characters to show for expanded TABs,
" trailing whitespace, and end-of-lines. VERY useful!
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif
set list                " Show problematic characters.

" Also highlight all tabs and trailing whitespace characters.
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$\|\t/

set ignorecase          " Make searching case insensitive
set smartcase           " ... unless the query has capital letters.
set gdefault            " Use 'g' flag by default with :s/foo/bar/.

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

" Search and Replace
nmap <Leader>s :%s//g<Left><Left>

" true color
"set termguicolors

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
" plugs go here
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'elixir-lang/vim-elixir'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"Plug 'jesseleite/vim-agriculture'
Plug 'mhinz/vim-signify'
"Plug 'airblade/vim-gitgutter'

Plug 'wesQ3/vim-windowswap'
Plug 'scrooloose/nerdcommenter'

" themes
Plug 'joshdick/onedark.vim'
Plug 'tomasr/molokai'
call plug#end()

" edit .vimrc
nnoremap <Leader>fed :e ~/.config/nvim/init.vim<CR>

" source .vimrc
nnoremap <Leader>feR :so ~/.config/nvim/init.vim<CR>

nnoremap <Leader>pu :PlugUpdate<CR>
nnoremap <Leader>pc :PlugClean<CR>

map <C-\> :NERDTreeToggle<CR>

" go to file in project
map <C-l> :CtrlP<CR>
" go to file in open buffers
nnoremap <Leader>bb :CtrlPBuffer<CR>
nnoremap <Leader>bl :ls<CR>
" go to file in recent files
nnoremap <Leader>br :CtrlPMRUFiles<CR>
nnoremap <Leader>bd :bp\|bd #<CR>
nnoremap <Leader><tab> :bp<CR>
nnoremap <Leader>bp :bp<CR>
nnoremap <Leader>bn :bn<CR>

" moving around windows
nnoremap <Leader>wl <C-W><C-L>
nnoremap <Leader>wj <C-W><C-J>
nnoremap <Leader>wk <C-W><C-K>
nnoremap <Leader>wh <C-W><C-H>
nnoremap <Leader>wn <C-W><C-W>
nnoremap <Leader>wm <C-W>_
nnoremap <Leader>w= <C-W>=

" splitting
nnoremap <Leader>w/ :vsp<CR>
nnoremap <Leader>w- :sp <CR>
nnoremap <Leader>wd :hide<CR>
nnoremap <Leader>ps :wa<CR>
nnoremap <Leader>ff :e ~

"search
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)

nmap <Leader>/ :Ag<CR>

nnoremap <Leader>qq :qa<CR>

"highlight clear SignColumn
highlight GitGutterAdd ctermfg=green
highlight GitGutterChange ctermfg=yellow
highlight GitGutterDelete ctermfg=red
highlight GitGutterChangeDelete ctermfg=yellow

"" highlight lines in Sy and vimdiff etc.)

"highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
"highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
"highlight DiffChange        cterm=bold ctermbg=none ctermfg=227

"" highlight signs in Sy

"highlight SignifySignAdd    cterm=bold ctermbg=none  ctermfg=119
"highlight SignifySignDelete cterm=bold ctermbg=none  ctermfg=167
"highlight SignifySignChange cterm=bold ctermbg=none  ctermfg=227


let g:NERDCustomDelimiters = {
            \ 'c': { 'leftAlt': '/*', 'rightAlt': '*/', 'left': '//' },
            \ 'cpp': { 'leftAlt': '/*', 'rightAlt': '*/', 'left': '//' }
            \ }
nmap <C-_> <Plug>NERDCommenterToggle
vmap <C-_> <Plug>NERDCommenterToggle gv
nmap <leader>cc <plug>NERDCommenterToggle
vmap <leader>cc <plug>NERDCommenterToggle gv

nmap <Leader>gs :Gstatus<CR>


"colorscheme onedark
colorscheme molokai
