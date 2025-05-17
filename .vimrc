" -------
" Options
" -------
" Basic settings
set nocompatible
filetype plugin indent on
syntax enable
set nowrap
set mouse=a

" Performance optimizations
set lazyredraw
set ttyfast
set nocursorline
set nocursorcolumn
set nobackup
set noswapfile
set nowritebackup

" Usability improvements
set number
set relativenumber
set hidden
set wildmenu
set noshowcmd
set laststatus=2
set backspace=indent,eol,start
set noruler

" Indentation
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

" Search
set nohlsearch
set incsearch
set ignorecase
set smartcase

" Completion
set completeopt=menuone,noselect

" Split
set splitbelow
set splitright

" Colorscheme
set background=dark
colorscheme darkland

let g:netrw_banner=0 
let g:netrw_border = 0 

" ----------
" Keybinding
" ----------
let mapleader = " "

inoremap jk <Esc>
inoremap <C-l> <C-o>x

" Copy / Paste
nnoremap <Leader>y :silent! .w !xclip -sel clip<CR>
vnoremap <Leader>y :<C-u>silent! '<,'>w !xclip -sel clip<CR><CR>
nnoremap <Leader>p :silent! r !xclip -o -sel clip<CR>
vnoremap <Leader>p "_d:silent! r !xclip -o -sel clip<CR>
nnoremap Y y$

nnoremap <Leader>; V
nnoremap <Leader>a ggVG
vnoremap <Leader>; V
vnoremap <Leader>a ggVG

" ALT
nnoremap <Esc>l $
nnoremap <Esc>h ^
nnoremap <Esc>. :t.<CR>
nnoremap <Esc>n :m .+1<CR>==
nnoremap <Esc>p :m .-2<CR>==

nnoremap <Leader>e :Exp<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :bd<CR>
nnoremap <Leader>r :so $MYVIMRC<CR>

vnoremap > >gv
vnoremap < <gv

vnoremap <C-n> :move '>+1<CR>gv=gv
vnoremap <C-p> :move '<-2<CR>gv=gv
vnoremap <Leader>d "_d

nnoremap ]b :bnext<CR>
nnoremap [b :bprevious<CR>
nnoremap ]<space> o<Esc>
nnoremap [<space> O<Esc>

" ---------
"  PLUGINS
" ---------
call plug#begin()
    Plug 'tpope/vim-commentary'
    Plug 'machakann/vim-highlightedyank'
call plug#end()


" ----------------
"  PLUGINS SETTING
" ----------------
let g:highlightedyank_highlight_duration = 200
let g:highlightedyank_highlight_in_visual = 0
