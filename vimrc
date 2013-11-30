set nocompatible

syntax on

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

" Use The Silver Searcher
if executable("ag")
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
  let g:ctrlp_use_caching = 0
endif

function! s:SwitchColorScheme()
  if g:colors_name == 'Tomorrow-Night'
    colorscheme Tomorrow-Night-Bright
  elseif g:colors_name == 'Tomorrow-Night-Bright'
    colorscheme Tomorrow
  elseif g:colors_name == 'Tomorrow'
    colorscheme Tomorrow-Night
  endif
endfunction

function! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun

" Determines whether to insert a tab or use autocomplete
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction

augroup vimrcEx
  autocmd!

  autocmd BufReadPre * setlocal foldmethod=indent
  autocmd BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif

  autocmd BufRead,BufNewFile *.ru setfiletype ruby
  autocmd BufRead,BufNewFile *.md setfiletype markdown
  autocmd BufRead,BufNewFile Gemfile setfiletype ruby

  autocmd FileType text,markdown setlocal spell textwidth=78
  autocmd FileType gitcommit setlocal spell textwidth=72
  autocmd FileType php,ruby,javascript,xml,yml,html,coffee,js,emblem,em autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

  autocmd User Rails Rnavcommand config config -glob=**/* -suffix=.rb -default=routes

  " Jump to the last known cursor position, except for commit messages
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
augroup END

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
set list listchars=tab:»·,trail:·
set linespace=0
set nobackup
set nowritebackup
set noswapfile
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

let mapleader = " "

let g:ctrlp_show_hidden = 1
let g:html_indent_tags = 'li\|p'
let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'
let g:syntastic_check_on_open=1
let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"

colorscheme Tomorrow-Night

map <silent> <C-d> :NERDTreeToggle<CR>
map <silent> <F6> :call <SID>SwitchColorScheme()<CR>
map <Leader>ct :!`brew --prefix`/bin/ctags -R --exclude=.git --exclude=log *<CR>

noremap <Leader>S :update<CR>

nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <Leader>% :vsplit<cr>
nnoremap <Leader>- :split<cr>
nnoremap <Leader><Leader> <c-^>
nnoremap <silent> <Leader>/ :set invhlsearch<CR>
nnoremap § <C-]>
nnoremap zz za
nnoremap <silent> <leader>d <Plug>DashSearch
nnoremap <Leader>t :call RunCurrentSpecFile()<CR>|
nnoremap <Leader>s :call RunNearestSpec()<CR>|
nnoremap <Leader>l :call RunLastSpec()<CR>|
nnoremap <Leader>a :call RunAllSpecs()<CR>|

inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap jj <Esc>

vnoremap zz zf
