" Enable vim
set nocompatible

"====================[ Vundle ]===================="
" Clone vundle if not present
if !isdirectory(expand("~/.vim/bundle/vundle/.git"))
    !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
endif

" Required by Vundle, will be turned on later
filetype off

" Set runtime path with Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle 
Bundle 'gmarik/vundle'

" Vundle bundles
Bundle 'AutoClose'
Bundle 'hexHighlight.vim'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'shawncplus/phpcomplete.vim'
Bundle 'scrooloose/syntastic'
Bundle 'ervandew/supertab'
Bundle 'pangloss/vim-javascript'
Bundle 'derekwyatt/vim-scala'
Bundle 'gre/play2vim'
Bundle 'othree/html5.vim'
Bundle 'tpope/vim-surround'
Bundle 'kien/ctrlp.vim'
Bundle 'Lokaltog/vim-powerline'

" Required by Vundle
filetype plugin indent on

"====================[ Autocompletion ]===================="
" Enable autocompletion
set omnifunc=syntaxcomplete#Complete
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType phtml set omnifunc=phpcomplete#CompletePHP

" Closes omni completion preview window when exiting insert mode or moving
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif

" Enhance command-line completion
set wildmenu
set wildmode=list:longest

"====================[ Syntastic ]===================="
" Syntastic modes
let g:syntastic_mode_map = { 'mode': 'active',
                               \ 'active_filetypes': [],
                               \ 'passive_filetypes': ['scala'] }

"====================[ Ctrl-P ]===================="
" Don't manage working path
let g:ctrlp_working_path_mode = 0

"====================[ Lines ]===================="
" Don’t add empty newlines at the end of files
set binary
set noeol

" Enable line numbers
set number

" Highlight current line
set cursorline

"====================[ Search ]===================="
" Highlight searches
set hlsearch

" Ignore case of searches
set ignorecase

" Highlight dynamically as pattern is typed
set incsearch

" Add the g flag to search/replace by default
set gdefault

"====================[ Movement ]===================="
" Don’t reset cursor to start of line when moving around.
set nostartofline

" Allow cursor keys in insert mode
set esckeys

" Start scrolling three lines before the horizontal window border
set scrolloff=3

"====================[ Whitespace ]===================="
" Make tabs as wide as 4 spaces
set smartindent
set softtabstop=4
set shiftwidth=4
set expandtab

" Show “invisible” characters
"set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
"set list

"====================[ Appearance ]===================="
" Set color scheme
colorscheme molokai

" Default font for MacVim
set gfn=Monaco:h10

"====================[ Ctags ]===================="
" Enable ctags
set tags+=~/.vim/tags/sf-tags.tag

" Remaps tags to allow for dropdown menu when matches > 1
noremap <C-]> g<C-]>

"====================[ Remaps ]===================="
" Change mapleader
let mapleader=","

"====================[ Status Line ]===================="
" Always show status line
set laststatus=2

" Show the cursor position
"set ruler

" Show commands as you type them
set showcmd

" Show the current mode
set showmode

"====================[ Functions ]===================="
" Strip trailing whitespace (,ss)
function! StripWhitespace ()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  :%s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace ()<CR>

"====================[ Miscellaneous ]===================="
" Don’t show the intro message when starting vim
set shortmess=atI

" Enable mouse in all modes
set mouse=a

" Optimize for fast terminal connections
set ttyfast

" Show the filename in the window titlebar
set title

" Use UTF-8 without BOM
set encoding=utf-8 nobomb

" Disable error bells
set noerrorbells

" Enable syntax highlighting
syntax on

" Enable copying to Mac clipboard
set clipboard=unnamed,unnamedplus,autoselect

" Shortcut to paste from system clipboard
nnoremap <silent> <Leader>p "+p

" Disable MacVim toolbar on startup
if has("gui_running")
    set guioptions-=T 
endif

" set .swp file directory, make sure directory exists upon installation of dotfiles
set directory=~/.vim/tmp

