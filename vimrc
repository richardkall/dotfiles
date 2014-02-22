set nocompatible

syntax on

let mapleader = " "

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

filetype plugin indent on

augroup vimrcEx
  autocmd!

  " Turn on spellchecking and set textwidth for text and markdown files
  autocmd FileType text,markdown setlocal spell textwidth=78

  " Jump to the last known cursor position, except for commit messages
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile *.ru setfiletype ruby
  autocmd BufRead,BufNewFile *.md setfiletype markdown
  autocmd BufRead,BufNewFile Gemfile setfiletype ruby

  " Set Git commit messages to 72 characters wide
  autocmd FileType gitcommit setlocal spell textwidth=72

  " Automatically strip trailing whitespaces
  autocmd FileType php,ruby,javascript,xml,yml,html,coffee,js,emblem,em autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

  " Better rails.vim navigation
  autocmd User Rails Rnavcommand config config -glob=**/* -suffix=.rb -default=routes
augroup END

set autowrite
set backspace=2
set clipboard=unnamed
set cursorline
set encoding=utf-8
set expandtab
set foldenable
set foldmethod=syntax
set hidden
set history=50
set ignorecase
set incsearch
set laststatus=2
set linespace=0
set list listchars=tab:»·,trail:·
set nobackup
set noswapfile
set nowritebackup
set number
set numberwidth=5
set pastetoggle=<F2>
set relativenumber
set ruler
set scrolljump=1
set scrolloff=3
set shiftwidth=2
set showcmd
set showmatch
set showmode
set smartcase
set splitbelow
set splitright
set statusline=%<%f\ %w%h%m%r%*%=%-14.(%l,%c%V%)\ %p%%
set tabstop=2
set visualbell
set wildignore+=*/tmp/*,*/.tmp/*,*/.git/*,*/.sass-cache/*,*.DS_Store,*.keep,*.swp,*.zip
set wildmenu wildmode=list:longest,full

colorscheme Tomorrow-Night

" Use The Silver Searcher
if executable("ag")
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
  let g:ctrlp_use_caching = 0
endif

" Strip trailing whitespaces
function! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun

" Switch between color schemes
function! s:SwitchColorScheme()
  if g:colors_name == 'Tomorrow-Night'
    colorscheme Tomorrow-Night-Bright
  elseif g:colors_name == 'Tomorrow-Night-Bright'
    colorscheme Tomorrow
  elseif g:colors_name == 'Tomorrow'
    colorscheme Tomorrow-Night
  endif
endfunction

" Determines whether to insert a tab or use autocomplete
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction

" Show hidden files in Ctrl+P
let g:ctrlp_show_hidden = 1

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" vim-rspec mappings
nnoremap <Leader>t :call RunCurrentSpecFile()<CR>|
nnoremap <Leader>s :call RunNearestSpec()<CR>|
nnoremap <Leader>l :call RunLastSpec()<CR>|
nnoremap <Leader>a :call RunAllSpecs()<CR>|
let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'

" Check syntax when opening files
let g:syntastic_check_on_open=1

" Exclude JavaScript files in :Rtags via rails.vim due to warnings when parsing
let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"

" Toggle NERDTree
map <silent> <C-d> :NERDTreeToggle<CR>

" Switch color scheme
map <silent> <F6> :call <SID>SwitchColorScheme()<CR>

" Index Ctags
map <Leader>ct :!`brew --prefix`/bin/ctags -R --exclude=.git --exclude=log *<CR>

" Switch between the last two files
nnoremap <Leader><Leader> <c-^>

" Warn when using arrow keys
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Quicker save
noremap <Leader>S :update<CR>

" Toggle search highlighting
nnoremap <silent> <Leader>/ :set invhlsearch<CR>

" Quicker movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Split panes
nnoremap <Leader>% :vsplit<cr>
nnoremap <Leader>" :split<cr>

" Go to Ctag
nnoremap § <C-]>

" Quicker folds
nnoremap zz za
vnoremap zz zf

" Insert tab
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>

" Exit insert mode quickly
inoremap jj <Esc>

" Load local config
if filereadable($HOME . '/.vimrc.local')
  source ~/.vimrc.local
endif
