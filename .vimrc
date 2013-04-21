" Use Vim settings (must be first)
set nocompatible

" Use Vundle to manage plugins
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Keep 50 lines of command history
set history=1000

" Show the cursor position all the time
set ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)

" Display incomplete commands
set showcmd

" Do incremental searching
set incsearch

" Turn on syntax highlighting
syntax enable

" Highlight search terms
set hlsearch

" Always set autoindenting on
set autoindent

" Use Solarized theme
let g:solarized_termcolors=256
color solarized
let g:solarized_termtrans=1
let g:solarized_contrast="high"
let g:solarized_visibility="high"

" Map Solarized background toggle
call togglebg#map("<F5>")

" Assume a dark background
set background=dark

" Use utf-8 file encoding
set fileencoding=utf-8

" Use system clipboard
set clipboard=unnamedplus

" Abbrev. om messages (avoids 'hit enter')
set shortmess+=filmnrxoOtT

" Allow cursor beyond last character
set virtualedit=onemore

" Allow buffer switching without saving
set hidden

" Turn on backups
set backup

" Turn on persistent undo
set undofile
set undolevels=1000
set undoreload=10000

" Display current mode
set showmode

" Highlight current line
set cursorline
highlight clear SignColumn

" Always display the status line
set laststatus=2

" Status line segments
set statusline=%<%f\                       " Filename
set statusline+=%w%h%m%r                   " Options
" set statusline+=%{fugitive#statusline()} " Git Hotness
set statusline+=\ [%{&ff}/%Y]              " Filetype
set statusline+=\ [%{getcwd()}]            " Current dir
set statusline+=%=%-14.(%l,%c%V%)\ %p%%    " Right aligned file nav info

" No extra spaces between rows
set linespace=0

" Show line numbers
set nu

" Show matching brackets/parenthesis
set showmatch

" Case insensitive search
set ignorecase

" Case insensitive when UC present
set smartcase

" Show list instead of just completing
set wildmenu
set wildmode=list:longest,full

" Lines to scroll when cursor leaves screen
set scrolljump=5

" Minimum lines to keep above and below cursor
set scrolloff=3

" Auto fold code
set foldenable

" Whitespace settings
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

" Tab settings
set shiftwidth=2
set expandtab
set tabstop=4
set softtabstop=2

" Remove trailing whitespaces and ^M chars
autocmd FileType c,cpp,java,go,php,javascript,python,twig,xml,yml autocmd BufWritePre <buffer> call StripTrailingWhitespace()
autocmd FileType go autocmd BufWritePre <buffer> Fmt
autocmd BufNewFile,BufRead *.html.twig set filetype=html.twig

" Key mappings
let mapleader = ','

map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-L> <C-W>l<C-W>_
map <C-H> <C-W>h<C-W>_

nnoremap j gj
nnoremap k gk

cmap Tabe tabe

nnoremap Y y$

" Code folding options
nmap <leader>f0 :set foldlevel=0<CR>
nmap <leader>f1 :set foldlevel=1<CR>
nmap <leader>f2 :set foldlevel=2<CR>
nmap <leader>f3 :set foldlevel=3<CR>
nmap <leader>f4 :set foldlevel=4<CR>
nmap <leader>f5 :set foldlevel=5<CR>
nmap <leader>f6 :set foldlevel=6<CR>
nmap <leader>f7 :set foldlevel=7<CR>
nmap <leader>f8 :set foldlevel=8<CR>
nmap <leader>f9 :set foldlevel=9<CR>

" Toggle search highlighting
nmap <silent> <leader>/ :set invhlsearch<CR>

" Bundles
Bundle 'gmarik/vundle'

" Enable file type detection
filetype plugin indent on

