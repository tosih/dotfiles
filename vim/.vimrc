" vundle
set nocompatible
filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'wincent/command-t'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'itchyny/lightline.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'edkolev/tmuxline.vim'

call vundle#end()
filetype plugin indent on

set hidden
set history=100
filetype indent on
set nowrap
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set autoindent
set hlsearch
nnoremap <Leader><Leader> :e#<CR>
set showmatch
set nobackup
set noswapfile
set title
set list
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set wildignore+=*.log,*.sql,*.cache
let NERDTreeMapActivateNode='<right>'
let NERDTreeShowHidden=1
nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>j :NERDTreeFind<CR>

