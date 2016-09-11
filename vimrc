" ----------------------------------------------------------------------
" GENERAL
" ----------------------------------------------------------------------
set autowrite         " Autosave files when focus is lost
set foldmethod=indent " Fold based on indentation
set foldlevel=1       " Close all folds except highest level
set hidden            " Hide buffers instead of closing them
set ignorecase        " Ignore case in search patterns
set matchtime=3       " Speed up showmatch
set noswapfile        " Disable swapfiles
set pastetoggle=<F2>  " Toggle paste mode with <F2>
set showmatch         " Briefly jump to matching bracket
set smartcase         " Case sensitive if pattern contains upper case characters
set splitbelow        " Split windows below current one
set splitright        " Split windows right of current one

" Use space as leader
let mapleader = " "

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

augroup general
  autocmd!

  " Automatically strip trailing whitespace
  autocmd FileType html,javascript,jade,json,php,ruby,xml,yml autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespace()

  " Enable spellchecking for Markdown files
  autocmd FileType markdown setlocal spell

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile *.ru,Gemfile,VagrantFile setfiletype ruby
  autocmd BufRead,BufNewFile .{babel,eslint,stylelint}rc set filetype=json
augroup END

" ----------------------------------------------------------------------
" PLUGINS
" ----------------------------------------------------------------------
" Load plugins
call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'chriskempson/base16-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'elzr/vim-json'
Plug 'jiangmiao/auto-pairs'
Plug 'jwhitley/vim-matchit'
Plug 'mxw/vim-jsx'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdtree', {'on':  'NERDTreeToggle'}
Plug 'skwp/greplace.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
call plug#end()

" CtrlP
let g:ctrlp_show_hidden = 1
let g:ctrlp_working_path_mode = 0

" NERDTree
map <silent> <C-d> :NERDTreeToggle<CR>

" vim-jsx
let g:jsx_ext_required = 0

" -------------------------------------------------------------------
" UI
" -------------------------------------------------------------------
set background=dark          " Use dark background
set clipboard=unnamed        " Use system clipboard
set cursorline               " Highlight current line
set list                     " Show whitespace characters
set listchars=tab:»·,trail:· " Only show tabs and trailing spaces
set number                   " Show line numbers
set relativenumber           " Show relative line numbers
set ruler                    " Show cursor position
set scrolloff=3              " Keep 3 lines above/below the cursor when scrolling
set showcmd                  " Show info about current command
set visualbell               " Use visual bell instead of beeping

" Customize statusline
set statusline=%<%f\ %w%h%m%r%*%=%-14.(%l,%c%V%)\ %p%%

" Use base16 color scheme
colorscheme base16-default-dark

" ---------------------------------------------------------------------
" INDENTATION
" ---------------------------------------------------------------------
set expandtab    " Convert tabs to spaces
set shiftwidth=2 " Indent using 2 spaces
set tabstop=2    " A tab counts for 2 spaces

" Enable language-dependent indentation
filetype indent on

" ---------------------------------------------------------------------
" KEY BINDINGS
" ---------------------------------------------------------------------
" Warn when using arrow keys
nnoremap <Left> :echoe 'Use h'<CR>
nnoremap <Right> :echoe 'Use l'<CR>
nnoremap <Up> :echoe 'Use k'<CR>
nnoremap <Down> :echoe 'Use j'<CR>

" Switch between the last two files
nnoremap <Leader><Leader> <c-^>

" Toggle search highlighting
nnoremap <silent> <Leader>/ :set invhlsearch<CR>

" Split panes
nnoremap <Leader>% :vsplit<cr>
nnoremap <Leader>" :split<cr>

" Quick save
nnoremap <Leader>w :w<CR>

" ---------------------------------------------------------------------
" FUNCTIONS
" ---------------------------------------------------------------------
" Strip trailing whitespace
function! <SID>StripTrailingWhitespace()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun

" ---------------------------------------------------------------------
" LOCAL CONFIG
" ---------------------------------------------------------------------
if filereadable($HOME . '~/.vimrc.local')
  source ~/.vimrc.local
endif
