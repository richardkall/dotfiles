" ----------------------------------------------------------------------
" GENERAL
" ----------------------------------------------------------------------

set nocompatible      " Use Vim settings (keep at the top!)
set autowrite         " Autosave files when focus is lost
set backspace=2       " Make backspace work like in most other apps
set clipboard=unnamed " Use system clipboard
set encoding=utf-8    " Set character encoding to UTF-8
set foldmethod=indent " Fold based on language syntax
set foldlevel=1       " Close all folds except highest level
set hidden            " Hide buffers instead of closing them
set ignorecase        " Ignore case in search patterns
set incsearch         " Use incremental searching
set matchtime=3       " Speed up showmatch
set noswapfile        " Disable swapfiles
set pastetoggle=<F2>  " Toggle paste mode with <F2>
set showmatch         " Briefly jump to matching bracket
set smartcase         " Case sensitive if pattern contains upper case characters
set splitbelow        " Split windows below current one
set splitright        " Split windows right of current one

" Ignore pattern
set wildignore+=*/tmp/*,*/.tmp/*,*/.git/*,*/.sass-cache/*,*.DS_Store,*.keep,*.swp,*.zip,*/.hg/*

" Use space as leader
let mapleader = " "

" Use ag over grep
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
endif

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Load plugins
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

" Enable file type detection
filetype plugin on

augroup general
  autocmd!

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile *.md setfiletype markdown
  autocmd BufRead,BufNewFile *.ru setfiletype ruby
  autocmd BufRead,BufNewFile Gemfile setfiletype ruby

  " Set textwidth to 78 characters for text files
  autocmd FileType text setlocal textwidth=78

  " Set Git commit messages to 72 characters wide
  autocmd FileType gitcommit setlocal spell textwidth=72

  " Enable spellchecking for Markdown files
  autocmd FileType markdown setlocal spell

  " Jump to the last known cursor position, except for commit messages
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Automatically strip trailing whitespace
  autocmd FileType php,ruby,javascript,xml,yml,html,js autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespace()
augroup END


" -------------------------------------------------------------------
" UI
" -------------------------------------------------------------------

set background=dark          " Use dark background
set cursorline               " Highlight current line
set laststatus=2             " Always display status line
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

" Enable syntax highlighting
syntax on

" Use base16 color scheme
colorscheme base16-default


" ---------------------------------------------------------------------
" INDENTATION
" ---------------------------------------------------------------------

set expandtab    " Convert tabs to spaces
set shiftwidth=2 " Indent using 2 spaces
set tabstop=2    " A tab counts for 2 spaces

" Enable language-dependent indenting
filetype indent on


" ---------------------------------------------------------------------
" PLUGIN SETTINGS
" ---------------------------------------------------------------------

" CtrlP
let g:ctrlp_show_hidden = 1
let g:ctrlp_working_path_mode = 0

if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
  let g:ctrlp_use_caching = 0
endif

" NERDTree
map <silent> <C-d> :NERDTreeToggle<CR>

" rails.vim
let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"

" rspec.vim
nnoremap <Leader>t :call RunCurrentSpecFile()<CR>|
nnoremap <Leader>s :call RunNearestSpec()<CR>|
nnoremap <Leader>l :call RunLastSpec()<CR>|
nnoremap <Leader>a :call RunAllSpecs()<CR>|
let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'

" Syntastic
let g:syntastic_check_on_open=1


" ---------------------------------------------------------------------
" KEY BINDINGS
" ---------------------------------------------------------------------

" Warn when using arrow keys
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Switch between the last two files
nnoremap <Leader><Leader> <c-^>

" Exit insert mode quickly
inoremap jj <Esc>

" Toggle search highlighting
nnoremap <silent> <Leader>/ :set invhlsearch<CR>

" Split panes
nnoremap <Leader>% :vsplit<cr>
nnoremap <Leader>" :split<cr>

" Insert tab or use autocomplete
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>

" Index Ctags
map <Leader>ct :!`brew --prefix`/bin/ctags -R --exclude=.git --exclude=log *<CR>

" Go to Ctag
nnoremap § <C-]>


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

" Determine whether to insert a tab or use autocomplete
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction


" ---------------------------------------------------------------------
" LOCAL CONFIG
" ---------------------------------------------------------------------

if filereadable($HOME . '/.vimrc.local')
  source ~/.vimrc.local
endif
