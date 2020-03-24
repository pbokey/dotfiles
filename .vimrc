" Make Vim more useful
set nocompatible
" Use the Desert Dark theme
" set background=dark

" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Change mapleader
let mapleader=","
" Don’t add empty newlines at the end of files
set binary
" Centralize backups, swapfiles and undo history
set backupdir=~/dotfiles/.vim/backups
set directory=~/dotfiles/.vim/swaps
if exists("&undodir")
set undodir=~/dotfiles/.vim/undo
endif

set autochdir
cd %:h
" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

 " Respect modeline in files
 set modeline
 set modelines=4
 " Enable line numbers
 set number
 " Enable syntax highlighting
 syntax enable
 syntax on
 " Highlight current line
 set cursorline
 " Make tabs as wide as two spaces
 set tabstop=2
 " Show “invisible” characters
 " set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
 " set list
 " Highlight searches
 set hlsearch
 " Ignore case of searches
 set ignorecase
 " Highlight dynamically as pattern is typed
 set incsearch
 " Always show status line
 set laststatus=2
 " Enable mouse in all modes
 set mouse=a
 " Disable error bells
 set noerrorbells
 " Don’t reset cursor to start of line when moving around.
 set nostartofline
 " Show the cursor position
 set ruler
 " Don’t show the intro message when starting Vim
 set shortmess=atI
 " Show the current mode
 set showmode
 " Show the filename in the window titlebar
 set title
 " Show the (partial) command as it’s being typed
 set showcmd
 " Start scrolling three lines before the horizontal window border
 set scrolloff=3
 " Lazy redraw screen
 set lazyredraw
 " show last characters added
 nnoremap gV `[v`]
 " show graphical tree
 nnoremap <leader>u :GundoToggle<CR>
 "show NERDTree
 nmap  <leader>n :NERDTreeTabsToggle<CR>

 nmap <S-Enter> O<Esc>
 nmap <CR> o<Esc>
 nnoremap R "_d

 let g:nerdtree_tabs_open_on_console_startup=1

 " COC configs
 let g:coc_global_extensions = [
 \ 'coc-snippets',
 \ 'coc-pairs',
 \ 'coc-tsserver',
 \ 'coc-prettier',
 \ 'coc-json',
 \ ]


 function! s:check_back_space() abort
   let col = col('.') - 1
   return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
\ pumvisible() ? "\<C-n>" :
\ <SID>check_back_space() ? "\<TAB>" :
\ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

set timeoutlen=1000 ttimeoutlen=0

" custom mappings
inoremap <silent><expr> <c-space> coc#refresh()
nnoremap j k
nnoremap k j
nnoremap <leader>u 10k
nnoremap  <leader>d  10j
vnoremap j k
vnoremap k j
vnoremap <leader>u 10k
vnoremap  <leader>d  10j
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gi <Plug>(coc-implementation)
nnoremap <leader>/  :nohl<CR>
nnoremap <leader>s :w<CR>
nnoremap gb :Gblame<CR>
nnoremap <leader>q :q<CR>
map <leader>h :tabr<cr>
map <leader>l :tabl<cr>

"jsx ft
autocmd BufNewFile,BufRead *.jsx setlocal ft=html ft=javascript

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

nnoremap <silent> K :call <SID>show_documentation()<CR>


nmap <F2> <Plug>(coc-rename)
xmap <leader>f  <Plug><coc-format-selected)
nmap <leader>f  <Plug>coc-format-selected)

" indent stuff 
set expandtab
set shiftwidth=2
set smarttab
set autoindent
set smartindent

  " Strip trailing whitespace (,ss)
function! StripWhitespace()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction

noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Automatic commands
if has("autocmd")
  " Enable file type detection
  filetype on
  " Treat .json files as .js
  autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
  " Treat .md files as Markdown
  autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
endif

" inject all plugins
set nocompatible
set rtp+="~/dotfiles/.vim/autoload/pathogen.vim"

execute pathogen#infect()

if has('python3')
  let g:gundo_prefer_python3 = 1
endif

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Begin Vundle Config
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=/home/pbokey/dotfiles/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

  " let Vundle manage Vundle, required

  Plugin 'VundleVim/Vundle.vim'
  Plugin 'vim-airline/vim-airline'
  Plugin 'neoclide/coc.nvim', {'branch': 'release'}
  Plugin 'sjl/gundo.vim'
  Plugin 'yggdroot/indentline'
  Plugin 'preservim/nerdtree'
  Bundle 'jistr/vim-nerdtree-tabs'
  Plugin 'preservim/nerdcommenter'
  Plugin 'Chiel92/vim-autoformat'
  Plugin 'artur-shaik/vim-javacomplete2'
  Plugin 'tpope/vim-fugitive'
  Plugin 'maxmellon/vim-jsx-pretty'
  Plugin 'severin-lemaignan/vim-minimap'
  Plugin 'christoomey/vim-tmux-navigator'
  Plugin 'othree/yajs.vim'
  Plugin 'arcticicestudio/nord-vim'
  Plugin 'vim-airline/vim-airline-themes'
  Plugin 'tpope/vim-eunuch'
  Plugin 'jiangmiao/auto-pairs'
  Plugin 'mihaifm/bufstop'
  Plugin 'fatih/vim-go'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" End Vundle Config

" FORMATTERS
au FileType javascript setlocal formatprg=prettier
au FileType javascript.jsx setlocal formatprg=prettier
au FileType typescript setlocal formatprg=prettier\ --parser\ typescript
au FileType html setlocal formatprg=js-beautify\ --type\ html
au FileType scss setlocal formatprg=prettier\ --parser\ css
au FileType css setlocal formatprg=prettier\ --parser\ css

colorscheme nord
let g:airline_theme='nord'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0

" buffer commands
nmap <leader>l :bnext<CR>
nmap <leader>h :bprevious<CR>
map <leader>b :BufstopMode<CR>

let g:BufstopAutoSpeedToggle = 1       " now I can press ,3,3,3 to cycle the last 3 buffers
map <C-tab>   :BufstopBack<CR>
map <S-tab>   :BufstopForward<CR>

set noshowmode
set hidden
set conceallevel=0
