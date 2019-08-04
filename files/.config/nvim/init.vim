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


" TODO group these (search, git, navigation, files, editor config)
" TODO clean up unused stuff

syntax on
" https://vim.fandom.com/wiki/Fix_syntax_highlighting
syntax sync minlines=200

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
"set gdefault            " Use 'g' flag by default with :s/foo/bar/.

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

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" themes
Plug 'joshdick/onedark.vim'
Plug 'tomasr/molokai'
Plug 'srcery-colors/srcery-vim'

call plug#end()

" edit .init.vim
nnoremap <Leader>fed :e ~/.config/nvim/init.vim<CR>
" edit .vimrc
nnoremap <Leader>fev :e ~/.vimrc<CR>

" source .init.vim
nnoremap <Leader>fer :so ~/.config/nvim/init.vim<CR>
nnoremap <Leader>feR :so ~/.config/nvim/init.vim<CR>

nnoremap <Leader>pu :PlugUpdate<CR>
nnoremap <Leader>pc :PlugClean<CR>

map <C-\> :NERDTreeToggle<CR>
map <M-\> :NERDTreeFind<CR>
map <C-o> :NERDTreeFind<CR>

" go to file in project
"map <C-l> :CtrlP<CR>
"nmap <Leader>/ :GFiles<CR>
" TODO: more FZF fun(current buffer, open buffers): https://github.com/junegunn/fzf.vim
nmap <C-l> :FZF<CR>
" This ruins stuff?
" imap <C-l> <Esc>:FZF<CR>

" recent buffers
nnoremap <Leader>bb :CtrlPMRUFiles<CR>
" c stands for "current"
nnoremap <Leader>bc :Buffers<CR>
nnoremap <Leader>bl :ls<CR>
" go to file in recent files
nnoremap <Leader>bd :bp\|bd #<CR>

" switching between the last two buffers in the window
nnoremap <Leader><tab> :b#<CR>
nnoremap <Leader>bp :bp<CR>
nnoremap <Leader>bn :bn<CR>

" moving around windows
nnoremap <Leader>wl <C-W><C-L>
nnoremap <Leader>wj <C-W><C-J>
nnoremap <Leader>wk <C-W><C-K>
nnoremap <Leader>wh <C-W><C-H>
nnoremap <Leader>wn <C-W><C-W>
" maximize the window
nmap <Leader>wm <C-W>_ <C-W>\|
" distribute the windows equally
nnoremap <Leader>w= <C-W>=

" splitting
nnoremap <Leader>w/ :vsp<CR>
nnoremap <Leader>w- :sp <CR>
nnoremap <Leader>wd :hide<CR>
" save all open buffers
nnoremap <Leader>ps :wa<CR>
" refresh the currently edited file from disk
nnoremap <Leader>fR :e!<CR>

" https://vi.stackexchange.com/questions/458/how-can-i-reload-all-buffers-at-once
nnoremap <Leader>fr :checktime<CR>
nnoremap <Leader>ff :e ~/

" navigating between git changes
nmap <leader>gj <plug>(signify-next-hunk)
" S- is shift
nmap <C-j> <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)
nmap <C-k> <plug>(signify-prev-hunk)

nmap <leader>gJ 9999<leader>gj
nmap <leader>gK 9999<leader>gk

" ctrl-p and ctrl-n for previous fzf searches
let g:fzf_history_dir = '~/.fzf-history'

"search just the contents
" TODO another, fuzzier version without --no-sort
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--no-sort --delimiter : --nth 4..'}, <bang>0)
command! -bang -nargs=* AgFuzzy call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)

" TODO and set this to <Leader>*
"fu! FzfAgCurrWord()
  "call fzf#vim#ag(expand('<cword>'))
"endfu

nmap <Leader>sf :Ag<CR>
" intentional space
"nmap <Leader>/ :Ag 
nmap <Leader>/ :AgFuzzy<CR>
" resume last :Ag search
nmap <Leader>sl :Ag<CR><C-p>
nmap <Leader>b/ :BLines<CR>
" --hidden makes ag not skip the hidden files when searching
let $FZF_DEFAULT_COMMAND = 'ag --hidden -g ""'
nnoremap <Leader>qq :qa<CR>

let g:NERDCustomDelimiters = {
            \ 'c': { 'leftAlt': '/*', 'rightAlt': '*/', 'left': '//' },
            \ 'cpp': { 'leftAlt': '/*', 'rightAlt': '*/', 'left': '//' }
            \ }
nmap <C-_> <Plug>NERDCommenterToggle
vmap <C-_> <Plug>NERDCommenterToggle gv

nmap <Leader>gs :Gstatus<CR>
nmap <Leader>gc :Gcommit<CR>
nmap <Leader>gp :Git shove<CR>
nmap <Leader>gb :Gblame<CR>
nmap <Leader>gll :Gbrowse<CR>
" the trailing space is here for a reason!
nmap <Leader>gg :Git 
" search through commits
nmap <Leader>g/c :Commits<CR>
" search through commits for the current file
nmap <Leader>g/b :BCommits<CR>

" system clipboard copy in visual mode
" thanks @lpil!
vmap <C-c> "+y

" dashes are parts of words
set iskeyword+=-

nmap <Leader>yw byw
nmap <Leader>yW ByW
nmap <C-c> b"+yw
"nmap <Leader>cw b"+yw

" Terminal!
nmap <Leader>tt :terminal<CR>
" exiting terminal mode with Esc
" this messes up fzf a bit
"tnoremap <Esc> <C-\><C-n>
tnoremap <C-i> <C-\><C-n>
" openint terminal in Terminal-mode (ready to go)
autocmd TermOpen * startinsert

":set ttimeoutlen 5000
" make the leadr key timeout a bit longer
set timeoutlen=4000

set foldmethod=manual
"set foldmethod=indent

"colorscheme onedark
"colorscheme molokai
"colorscheme default
colorscheme srcery

" this disables the branch name in the config
let g:airline_section_b = airline#section#create(['hunks'])
" this disables the utf-8[unix] part
let g:airline_section_y = airline#section#create([])

set spell
set spelllang=en

" for :checkhealth TODO
" let g:python_host_prog
" those are virtualenv paths, could be any python executables
let g:python_host_prog='/home/nietaki/.pyenv/versions/neovim-27/bin/python'
let g:python3_host_prog='/home/nietaki/.pyenv/versions/neovim-370/bin/python3'

"set esckeys
"inoremap <S-Tab> <C-n>

" CoC vim
" e tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"<Paste>

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)
