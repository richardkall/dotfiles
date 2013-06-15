" Leader
let mapleader = " "

set nocompatible  " Use Vim settings, rather then Vi settings
set nobackup
set nowritebackup
set noswapfile
set history=50
set ruler         " Show the cursor position all the time
set showcmd       " Display incomplete commands
set incsearch     " Do incremental searching
set laststatus=2  " Always display the status line

" Turn on syntax highlighting
syntax on

" Load bundles
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

" Enable file type detection
filetype plugin indent on

augroup vimrcEx
  autocmd!

  " Set textwidth to 78 characters for all textfiles
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Cucumber navigation commands
  autocmd User Rails Rnavcommand step features/step_definitions -glob=**/* -suffix=_steps.rb
  autocmd User Rails Rnavcommand config config -glob=**/* -suffix=.rb -default=routes

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile *.md set filetype=markdown

  " Enable spellchecking for Markdown
  autocmd BufRead,BufNewFile *.md setlocal spell

  " .ru files are Ruby
  autocmd BufRead,BufNewFile *.ru setfiletype ruby

  " Automatically wrap at 80 characters for Markdown
  autocmd BufRead,BufNewFile *.md setlocal textwidth=80
augroup END

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·

if executable("ag")
  set grepprg=ag\ --nogroup\ --nocolor
endif

" Color scheme
colorscheme github
highlight NonText guibg=#060606
highlight Folded  guibg=#0A0A0A guifg=#9090D0

" Numbers
set number
set numberwidth=5

" Snippets are activated by Shift+Tab
let g:snippetsEmu_key = "<S-Tab>"

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
set complete=.,w,t
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>

" Exclude Javascript files in :Rtags via rails.vim due to warnings when parsing
let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"

" Index ctags from any project, including those outside Rails
map <Leader>ct :!ctags -R .<CR>

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Turn off arrow keys
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" vim-rspec mappings
nnoremap <Leader>t :call RunCurrentSpecFile()<CR>
nnoremap <Leader>s :call RunNearestSpec()<CR>
nnoremap <Leader>l :call RunLastSpec()<CR>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" configure syntastic syntax checking to check on open as well as save
let g:syntastic_check_on_open=1

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Use utf-8
set fileencoding=utf-8
set encoding=utf-8

" Abbrev. om messages (avoids 'hit enter')
set shortmess+=filmnrxoOtT

" Use system clipboard
set clipboard=unnamedplus

" Allow buffer switching without saving
set hidden

" Display current mode
set showmode

" Highlight current line
set cursorline
highlight clear SignColumn

" Status line segments
set statusline=%<%f
set statusline+=\ %w%h%m%r%*
set statusline+=%=%-14.(%l,%c%V%)\ %p%%

" Case insensitive search
set ignorecase

" Case sensitive when UC present
set smartcase

" No extra spaces between rows
set linespace=0

" Show matching brackets/parenthesis
set showmatch

" Show list instead of just completing
set wildmenu
set wildmode=list:longest,full

" Lines to scroll when cursor leaves screen
set scrolljump=1

" Minimum lines to keep above and below cursor
set scrolloff=3

" Enable visual bell
set visualbell

" Remove trailing whitespaces
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd FileType c,cpp,java,php,ruby,python,javascript,xml,yml,html autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" Faster copy
nnoremap Y y$

" Paste toggle
set pastetoggle=<F2>

" Toggle search highlighting
nmap <silent> <leader>/ :set invhlsearch<CR>
