syntax on
set number
set relativenumber
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set mouse=a
set encoding=utf-8
filetype plugin indent on

set incsearch
set hlsearch
set ignorecase
set smartcase

set showmatch

set noswapfile

set clipboard=unnamedplus

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'dense-analysis/ale'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'jiangmiao/auto-pairs'

call plug#end()

let mapleader = " "

nnoremap <Esc> :nohlsearch<CR>
nnoremap <leader>x :NERDTreeToggle<CR>
nnoremap <leader>p :Files<CR>
nnoremap <leader>sg :Rg<CR>
