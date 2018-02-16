" Enable vim
set nocompatible

"====================[ autocmds ]===================="
" This section is up here so plugins can override autocmds and take priority.
"
" .sc files are Ammonite scripts (Scala)
autocmd BufNewFile,BufRead *.sc set filetype=scala

" .md files are Markdown
autocmd BufNewFile,BufRead *.md set filetype=markdown
"
" Vagrantfiles are ruby
autocmd BufNewFile,BufRead Vagrantfile set filetype=ruby

"====================[ vim-plug ]===================="
" Clone vim-plug if not present
if empty(glob("~/.vim/autoload/plug.vim"))
    !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.vim/plugged')

" plugins
" scala
Plug 'derekwyatt/vim-scala'
Plug 'gre/play2vim'

" rust
Plug 'rust-lang/rust.vim'

" buffers
Plug 'fholgado/minibufexpl.vim'

" general ui stuff
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'

" plugins for parens & brackets
Plug 'Townk/vim-autoclose'
Plug 'tpope/vim-surround'

" other syntax highlighting
Plug 'pangloss/vim-javascript'
Plug 'othree/html5.vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'GEverding/vim-hocon'
Plug 'tpope/vim-liquid'
Plug 'chase/vim-ansible-yaml'
Plug 'jparise/vim-graphql'

" misc
Plug 'scrooloose/syntastic'
Plug 'ervandew/supertab'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-repeat'

call plug#end()

filetype plugin indent on

"====================[ Remaps ]===================="
" Change mapleader
let mapleader=","

"====================[ Autocompletion ]===================="
" Enable autocompletion
set omnifunc=syntaxcomplete#Complete

" Closes omni completion preview window when exiting insert mode or moving
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif

" Enhance command-line completion
set wildmenu
set wildmode=list:longest
set wildignore+=*target/*,*target-*/*,*.class

"====================[ Syntastic ]===================="
" Syntastic modes
let g:syntastic_mode_map = { 'mode': 'active',
                               \ 'active_filetypes': [],
                               \ 'passive_filetypes': ['scala'] }

" turn off standard python checker and just use flake8
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_args='--ignore=E501'

"====================[ Ctrl-P ]===================="
" Don't manage working path
let g:ctrlp_working_path_mode = 0

" Ignore dotfiles
let g:ctrlp_dotfiles = 0
let g:ctrlp_custom_ignore = {
  \ 'dir': 'node_modules'
  \ }

" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" ag is fast enough that CtrlP doesn't need to cache
let g:ctrlp_use_caching = 0

"====================[ Search ]===================="

" Use ag over grep
set grepprg=ag\ --nogroup\ --nocolor

" Search word under cursor with grepprg (ag) in working dir
nnoremap <Leader>* :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

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

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

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
" Make tabs as wide as 2 spaces
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround

" Show “invisible” characters
"set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
"set list

"====================[ Appearance ]===================="
" Set color scheme
colorscheme molokai

" Default font for MacVim
" set gfn=Monaco:h10
set gfn=Inconsolata:h14

" Enable syntax highlighting
syntax on

" Line length column
set colorcolumn=120

"====================[ Splits ]===================="
" Open new horizontal splits below and vertical splits right
set splitbelow
set splitright

"====================[ Ctags ]===================="
" Enable ctags
set tags+=~/.vim/tags/scala-tags.tag

" Remaps tags to allow for dropdown menu when matches > 1
noremap <C-]> g<C-]>

"====================[ Supertab ]===================="
" 'Enter' (<cr>) completes without inserting newline
let g:SuperTabCrMapping = 1

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
function! StripWhitespace()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  :%s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfunction
noremap <Leader>ss :call StripWhitespace()<CR>

"====================[ Gitgutter ]===================="
" Turn off realtime gitgutter updates
let g:gitgutter_realtime = 0

" Turn off eager gitgutter
let g:gitgutter_eager = 0

"====================[ MiniBufExplorer ]===================="
" Put new window above
let g:miniBufExplBRSplit = 0

hi link MBENormal                Comment
hi link MBEChanged               String
hi link MBEVisibleNormal         Special
hi link MBEVisibleChanged        String
hi link MBEVisibleActiveNormal   Boolean
hi link MBEVisibleActiveChanged  Error

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

" Open help pages in vertical buffers
cnoremap help vert help

" set time to write to swap file (in ms)
set updatetime=100
