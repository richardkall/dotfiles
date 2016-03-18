call plug#begin('~/.config/nvim/plugins')

Plug 'airblade/vim-gitgutter'
Plug 'benekastah/neomake'
Plug 'chriskempson/base16-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'digitaltoad/vim-jade'
Plug 'ekalinin/Dockerfile.vim'
Plug 'elzr/vim-json'
Plug 'jiangmiao/auto-pairs'
Plug 'jwhitley/vim-matchit'
Plug 'kristijanhusak/vim-multiple-cursors'
Plug 'mxw/vim-jsx'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree', {'on':  'NERDTreeToggle'}
Plug 'Shougo/neocomplcache.vim'
Plug 'skwp/greplace.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

if filereadable(expand('~/.nvim.plugins.local'))
  source ~/.nvim.plugins.local
endif

call plug#end()
